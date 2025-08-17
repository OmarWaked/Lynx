//
//  AdminPanelView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI
import Firebase

struct AdminPanelView: View {
    @StateObject private var seeder = FirebaseDataSeeder()
    @State private var isSeeding = false
    @State private var isClearing = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    
    var body: some View {
        NavigationView {
            List {
                Section("Firebase Data Management") {
                    Button(action: seedData) {
                        HStack {
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.green)
                            Text("Seed Demo Data")
                            Spacer()
                            if isSeeding {
                                ProgressView()
                                    .scaleEffect(0.8)
                            }
                        }
                    }
                    .disabled(isSeeding)
                    
                    Button(action: clearData) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                            Text("Clear All Data")
                            Spacer()
                            if isClearing {
                                ProgressView()
                                    .scaleEffect(0.8)
                            }
                        }
                    }
                    .disabled(isClearing)
                }
                
                Section("Firebase Testing") {
                    NavigationLink(destination: FirebaseTestView()) {
                        HStack {
                            Image(systemName: "vial.fill")
                                .foregroundColor(.blue)
                            Text("Test Firebase Services")
                        }
                    }
                }
                
                Section("Firebase Services Status") {
                    ServiceStatusRow(service: "Authentication", isEnabled: true)
                    ServiceStatusRow(service: "Firestore", isEnabled: true)
                    ServiceStatusRow(service: "Storage", isEnabled: true)
                    ServiceStatusRow(service: "Analytics", isEnabled: false)
                    ServiceStatusRow(service: "Crashlytics", isEnabled: false)
                }
                
                Section("Firebase Configuration") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Project ID: lynx-waked")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("Storage Bucket: lynx-waked.firebasestorage.app")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("Bundle ID: com.waked.Lynx")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
                
                Section("Security Rules") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Firestore: User-based access control")
                            .font(.caption)
                        Text("Storage: User-based access control")
                            .font(.caption)
                        Text("Authentication: Email/Password enabled")
                            .font(.caption)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Admin Panel")
            .navigationBarTitleDisplayMode(.large)
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    private func seedData() {
        isSeeding = true
        
        Task {
            await seeder.seedAllData()
            
            await MainActor.run {
                isSeeding = false
                alertTitle = "Success"
                alertMessage = "Demo data has been seeded successfully!"
                showAlert = true
            }
        }
    }
    
    private func clearData() {
        isClearing = true
        
        Task {
            await seeder.clearAllData()
            
            await MainActor.run {
                isClearing = false
                alertTitle = "Success"
                alertMessage = "All data has been cleared successfully!"
                showAlert = true
            }
        }
    }
}

struct ServiceStatusRow: View {
    let service: String
    let isEnabled: Bool
    
    var body: some View {
        HStack {
            Text(service)
            Spacer()
            Image(systemName: isEnabled ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundColor(isEnabled ? .green : .red)
        }
    }
}

#Preview {
    AdminPanelView()
}
