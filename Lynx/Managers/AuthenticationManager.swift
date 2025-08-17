//
//  AuthenticationManager.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import Combine

class AuthenticationManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: UserProfile?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupAuthStateListener()
    }
    
    private func setupAuthStateListener() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.isAuthenticated = user != nil
                if let user = user {
                    self?.fetchUserProfile(uid: user.uid)
                } else {
                    self?.currentUser = nil
                }
            }
        }
    }
    
    func checkAuthenticationStatus() {
        isLoading = true
        if let user = Auth.auth().currentUser {
            fetchUserProfile(uid: user.uid)
        } else {
            isLoading = false
        }
    }
    
    private func fetchUserProfile(uid: String) {
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { [weak self] document, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let document = document, document.exists {
                    do {
                        let userProfile = try document.data(as: UserProfile.self)
                        self?.currentUser = userProfile
                    } catch {
                        self?.errorMessage = "Failed to load user profile: \(error.localizedDescription)"
                    }
                } else {
                    // Create new user profile
                    self?.createUserProfile(uid: uid)
                }
            }
        }
    }
    
    private func createUserProfile(uid: String) {
        guard let user = Auth.auth().currentUser else { return }
        
        let userProfile = UserProfile(
            uid: uid,
            email: user.email ?? "",
            displayName: user.displayName,
            photoURL: user.photoURL?.absoluteString,
            preferences: UserPreferences()
        )
        
        let db = Firestore.firestore()
        do {
            try db.collection("users").document(uid).setData(from: userProfile)
            self.currentUser = userProfile
        } catch {
            self.errorMessage = "Failed to create user profile: \(error.localizedDescription)"
        }
    }
    
    func signIn(email: String, password: String) {
        isLoading = true
        errorMessage = nil
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func signUp(email: String, password: String, displayName: String) {
        isLoading = true
        errorMessage = nil
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else if let user = result?.user {
                    // Update display name
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = displayName
                    changeRequest.commitChanges { error in
                        if let error = error {
                            DispatchQueue.main.async {
                                self?.errorMessage = error.localizedDescription
                            }
                        }
                    }
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func resetPassword(email: String) {
        isLoading = true
        errorMessage = nil
        
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
