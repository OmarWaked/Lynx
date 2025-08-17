//
//  SettingsView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true
    @AppStorage("locationEnabled") private var locationEnabled = true
    @State private var showLogoutAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    UserProfileSection(authManager: authManager)
                    PreferencesSection(
                        isDarkMode: $isDarkMode,
                        notificationsEnabled: $notificationsEnabled,
                        locationEnabled: $locationEnabled
                    )
                    AppSection()
                    SupportSection()
                    SignOutSection(showLogoutAlert: $showLogoutAlert, authManager: authManager)
                    
                    Spacer(minLength: 100)
                }
                .padding(.vertical, 16)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
        .alert("Sign Out", isPresented: $showLogoutAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Sign Out", role: .destructive) {
                authManager.signOut()
            }
        } message: {
            Text("Are you sure you want to sign out?")
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct UserProfileSection: View {
    let authManager: AuthenticationManager
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.purple]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 80, height: 80)
                    
                    Text("\(authManager.currentUser?.email.prefix(1).uppercased() ?? "U")")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(authManager.currentUser?.email ?? "User")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(.primary)
                    
                    Text("Member since 2024")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 15, x: 0, y: 8)
            )
        }
        .padding(.horizontal, 20)
    }
}

struct PreferencesSection: View {
    @Binding var isDarkMode: Bool
    @Binding var notificationsEnabled: Bool
    @Binding var locationEnabled: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Preferences")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.green, Color.blue]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .padding(.horizontal, 20)
            
            VStack(spacing: 12) {
                SettingRow(
                    icon: "moon.fill",
                    iconColor: .purple,
                    title: "Dark Mode",
                    isToggle: true,
                    toggleValue: $isDarkMode
                )
                .onChange(of: isDarkMode) { oldValue, newValue in
                    // Post notification to refresh the app's color scheme
                    NotificationCenter.default.post(name: NSNotification.Name("DarkModeChanged"), object: nil)
                    print("🌙 Dark mode changed to: \(newValue)")
                }
                
                SettingRow(
                    icon: "bell.fill",
                    iconColor: .orange,
                    title: "Push Notifications",
                    isToggle: true,
                    toggleValue: $notificationsEnabled
                )
                
                SettingRow(
                    icon: "location.fill",
                    iconColor: .green,
                    title: "Location Services",
                    isToggle: true,
                    toggleValue: $locationEnabled
                )
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 15, x: 0, y: 8)
            )
        }
        .padding(.horizontal, 20)
    }
}

struct AppSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("App")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .padding(.horizontal, 20)
            
            VStack(spacing: 12) {
                SettingRow(
                    icon: "info.circle.fill",
                    iconColor: .blue,
                    title: "About Lynx",
                    action: {
                        // TODO: Implement about view
                    }
                )
                
                SettingRow(
                    icon: "hand.raised.fill",
                    iconColor: .green,
                    title: "Privacy Policy",
                    action: {
                        // TODO: Implement privacy policy
                    }
                )
                
                SettingRow(
                    icon: "doc.text.fill",
                    iconColor: .orange,
                    title: "Terms of Service",
                    action: {
                        // TODO: Implement terms of service
                    }
                )
                
                SettingRow(
                    icon: "star.fill",
                    iconColor: .yellow,
                    title: "Rate App",
                    action: {
                        // TODO: Implement app rating
                    }
                )
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 15, x: 0, y: 8)
            )
        }
        .padding(.horizontal, 20)
    }
}

struct SupportSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Support")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .padding(.horizontal, 20)
            
            VStack(spacing: 12) {
                SettingRow(
                    icon: "questionmark.circle.fill",
                    iconColor: .blue,
                    title: "Help Center",
                    action: {
                        // TODO: Implement help center
                    }
                )
                
                SettingRow(
                    icon: "envelope.fill",
                    iconColor: .green,
                    title: "Contact Support",
                    action: {
                        // TODO: Implement contact support
                    }
                )
                
                SettingRow(
                    icon: "exclamationmark.triangle.fill",
                    iconColor: .orange,
                    title: "Report Bug",
                    action: {
                        // TODO: Implement bug report
                    }
                )
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 15, x: 0, y: 8)
            )
        }
        .padding(.horizontal, 20)
    }
}

struct SignOutSection: View {
    @Binding var showLogoutAlert: Bool
    let authManager: AuthenticationManager
    
    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                showLogoutAlert = true
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.red)
                    
                    Text("Sign Out")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.red)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.red.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.red.opacity(0.3), lineWidth: 1)
                        )
                )
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal, 20)
    }
}

struct SettingRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    var isToggle: Bool = false
    var toggleValue: Binding<Bool>? = nil
    var action: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(iconColor.opacity(0.1))
                    .frame(width: 36, height: 36)
                
                Image(systemName: icon)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(iconColor)
            }
            
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primary)
            
            Spacer()
            
            if isToggle, let toggleValue = toggleValue {
                Toggle("", isOn: toggleValue)
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
            } else {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.secondary)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if !isToggle {
                action?()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AuthenticationManager())
    }
}
