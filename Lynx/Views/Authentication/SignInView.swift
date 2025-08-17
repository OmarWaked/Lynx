//
//  SignInView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var email = ""
    @State private var password = ""
    @State private var showForgotPassword = false
    
    var body: some View {
        VStack(spacing: 24) {
            // Modern form container
            VStack(spacing: 20) {
                // Email field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                            .frame(width: 20)
                        
                        TextField("Enter your email", text: $email)
                            .textFieldStyle(PlainTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                            )
                    )
                }
                
                // Password field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.blue)
                            .frame(width: 20)
                        
                        SecureField("Enter your password", text: $password)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemGray6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                            )
                    )
                }
                
                // Forgot Password button
                HStack {
                    Spacer()
                    Button("Forgot Password?") {
                        showForgotPassword = true
                    }
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.blue)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.08), radius: 20, x: 0, y: 10)
            )
            
            // Sign In button
            Button(action: signIn) {
                HStack {
                    if authManager.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    } else {
                        Text("Sign In")
                            .font(.system(size: 18, weight: .semibold))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .foregroundColor(.white)
                .cornerRadius(16)
                .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .disabled(authManager.isLoading || email.isEmpty || password.isEmpty)
            .opacity((email.isEmpty || password.isEmpty) ? 0.6 : 1.0)
            
            // Error message
            if let errorMessage = authManager.errorMessage {
                Text(errorMessage)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.red)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.red.opacity(0.1))
                    )
            }
        }
        .sheet(isPresented: $showForgotPassword) {
            ForgotPasswordView()
        }
    }
    
    private func signIn() {
        Task {
            let result = await authManager.signIn(email: email, password: password)
            switch result {
            case .success:
                // Authentication successful, UI will update automatically
                break
            case .failure(let error):
                // Error is already handled in the manager
                print("Sign in failed: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthenticationManager())
}
