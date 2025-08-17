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

@MainActor
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
            Task { @MainActor in
                self?.isAuthenticated = user != nil
                if let user = user {
                    await self?.fetchUserProfile(uid: user.uid)
                } else {
                    self?.currentUser = nil
                }
            }
        }
    }
    
    func checkAuthenticationStatus() async {
        isLoading = true
        defer { isLoading = false }
        
        if let user = Auth.auth().currentUser {
            await fetchUserProfile(uid: user.uid)
        }
    }
    
    private func fetchUserProfile(uid: String) async {
        let db = Firestore.firestore()
        
        do {
            let document = try await db.collection("users").document(uid).getDocument()
            
            if document.exists {
                let userProfile = try document.data(as: UserProfile.self)
                currentUser = userProfile
            } else {
                // Create new user profile
                await createUserProfile(uid: uid)
            }
        } catch {
            errorMessage = "Failed to load user profile: \(error.localizedDescription)"
        }
    }
    
    private func createUserProfile(uid: String) async {
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
            currentUser = userProfile
        } catch {
            errorMessage = "Failed to create user profile: \(error.localizedDescription)"
        }
    }
    
    func signIn(email: String, password: String) async -> Result<Void, Error> {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return .success(())
        } catch {
            errorMessage = error.localizedDescription
            return .failure(error)
        }
    }
    
    func signUp(email: String, password: String, displayName: String) async -> Result<Void, Error> {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            
            // Update display name
            let changeRequest = result.user.createProfileChangeRequest()
            changeRequest.displayName = displayName
            try await changeRequest.commitChanges()
            
            return .success(())
        } catch {
            errorMessage = error.localizedDescription
            return .failure(error)
        }
    }
    
    func signOut() async -> Result<Void, Error> {
        do {
            try Auth.auth().signOut()
            return .success(())
        } catch {
            errorMessage = error.localizedDescription
            return .failure(error)
        }
    }
    
    func resetPassword(email: String) async -> Result<Void, Error> {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            return .success(())
        } catch {
            errorMessage = error.localizedDescription
            return .failure(error)
        }
    }
}
