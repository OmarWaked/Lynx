//
//  SignUpView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var displayName = ""
    
    private var isFormValid: Bool {
        !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && !displayName.isEmpty && password == confirmPassword && password.count >= 6
    }
    
    var body: some View {
        VStack(spacing: 24) {
            // Modern form container
            VStack(spacing: 20) {
                // Display Name field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Display Name")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.blue)
                            .frame(width: 20)
                        
                        TextField("Enter your name", text: $displayName)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.words)
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
                
                // Confirm Password field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Confirm Password")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    HStack {
                        Image(systemName: "lock.shield.fill")
                            .foregroundColor(.blue)
                            .frame(width: 20)
                        
                        SecureField("Confirm your password", text: $confirmPassword)
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
                
                // Validation messages
                VStack(alignment: .leading, spacing: 8) {
                    if !password.isEmpty && password.count < 6 {
                        HStack(spacing: 6) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.orange)
                                .font(.system(size: 12))
                            Text("Password must be at least 6 characters")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.orange)
                        }
                    }
                    
                    if !confirmPassword.isEmpty && password != confirmPassword {
                        HStack(spacing: 6) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 12))
                            Text("Passwords don't match")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.08), radius: 20, x: 0, y: 10)
            )
            
            // Sign Up button
            Button(action: signUp) {
                HStack {
                    if authManager.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(0.8)
                    } else {
                        Text("Create Account")
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
            .disabled(authManager.isLoading || !isFormValid)
            .opacity(isFormValid ? 1.0 : 0.6)
            
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
    }
    
    private func signUp() {
        Task {
            let result = await authManager.signUp(email: email, password: password, displayName: displayName)
            switch result {
            case .success:
                // Authentication successful, UI will update automatically
                break
            case .failure(let error):
                // Error is already handled in the manager
                print("Sign up failed: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    SignUpView()
        .environmentObject(AuthenticationManager())
}
