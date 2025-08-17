//
//  AuthenticationView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var isSignUp = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Modern gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.1),
                        Color.purple.opacity(0.05),
                        Color.blue.opacity(0.05)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Modern header with gradient
                    VStack(spacing: 24) {
                        // Logo with modern styling
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 100, height: 100)
                                .shadow(color: .blue.opacity(0.3), radius: 20, x: 0, y: 10)
                            
                            Image(systemName: "tag.circle.fill")
                                .font(.system(size: 50, weight: .medium))
                                .foregroundColor(.white)
                        }
                        
                        VStack(spacing: 12) {
                            Text("Lynx")
                                .font(.system(size: 42, weight: .bold, design: .rounded))
                                .foregroundStyle(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            
                            Text("Your Personal Coupon Companion")
                                .font(.system(size: 18, weight: .medium, design: .rounded))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                        }
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
                    // Authentication Forms with modern card design
                    VStack(spacing: 24) {
                        if isSignUp {
                            SignUpView()
                        } else {
                            SignInView()
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    // Modern toggle button
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            isSignUp.toggle()
                        }
                    }) {
                        HStack(spacing: 8) {
                            Text(isSignUp ? "Already have an account?" : "Don't have an account?")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.secondary)
                            
                            Text(isSignUp ? "Sign In" : "Sign Up")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.blue)
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 24)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color(.systemBackground))
                                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
                        )
                    }
                    .padding(.bottom, 40)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    AuthenticationView()
        .environmentObject(AuthenticationManager())
}
