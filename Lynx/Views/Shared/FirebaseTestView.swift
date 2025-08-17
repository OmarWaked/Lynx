//
//  FirebaseTestView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

struct FirebaseTestView: View {
    @State private var testResults: [String: TestResult] = [:]
    @State private var isRunningTests = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    enum TestResult {
        case pending
        case success
        case failure(String)
        
        var icon: String {
            switch self {
            case .pending: return "clock"
            case .success: return "checkmark.circle.fill"
            case .failure: return "xmark.circle.fill"
            }
        }
        
        var color: Color {
            switch self {
            case .pending: return .gray
            case .success: return .green
            case .failure: return .red
            }
        }
        
        var description: String {
            switch self {
            case .pending: return "Pending"
            case .success: return "Success"
            case .failure(let error): return "Failed: \(error)"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section("Firebase Services Test") {
                    Button(action: runAllTests) {
                        HStack {
                            Image(systemName: "play.fill")
                                .foregroundColor(.blue)
                            Text("Run All Tests")
                            Spacer()
                            if isRunningTests {
                                ProgressView()
                                    .scaleEffect(0.8)
                            }
                        }
                    }
                    .disabled(isRunningTests)
                }
                
                Section("Test Results") {
                    TestResultRow(
                        service: "Firebase Core",
                        result: testResults["core"] ?? .pending
                    )
                    
                    TestResultRow(
                        service: "Authentication",
                        result: testResults["auth"] ?? .pending
                    )
                    
                    TestResultRow(
                        service: "Firestore",
                        result: testResults["firestore"] ?? .pending
                    )
                    
                    TestResultRow(
                        service: "Storage",
                        result: testResults["storage"] ?? .pending
                    )
                }
                
                Section("Firebase Configuration") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Project: \(FirebaseApp.app()?.options.projectID ?? "Unknown")")
                            .font(.caption)
                        Text("Bundle: \(Bundle.main.bundleIdentifier ?? "Unknown")")
                            .font(.caption)
                        Text("Storage Bucket: \(FirebaseApp.app()?.options.storageBucket ?? "Unknown")")
                            .font(.caption)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Firebase Test")
            .navigationBarTitleDisplayMode(.large)
        }
        .alert("Test Results", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    private func runAllTests() {
        isRunningTests = true
        testResults.removeAll()
        
        // Test Firebase Core
        testFirebaseCore()
        
        // Test Authentication
        testAuthentication()
        
        // Test Firestore
        testFirestore()
        
        // Test Storage
        testStorage()
        
        // Check results after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isRunningTests = false
            showTestResults()
        }
    }
    
    private func testFirebaseCore() {
        testResults["core"] = .pending
        
        if FirebaseApp.app() != nil {
            testResults["core"] = .success
        } else {
            testResults["core"] = .failure("Firebase not initialized")
        }
    }
    
    private func testAuthentication() {
        testResults["auth"] = .pending
        
        let auth = Auth.auth()
        if auth.app != nil {
            testResults["auth"] = .success
        } else {
            testResults["auth"] = .failure("Auth not available")
        }
    }
    
    private func testFirestore() {
        testResults["firestore"] = .pending
        
        let db = Firestore.firestore()
        db.collection("test").document("connection").setData([
            "timestamp": FieldValue.serverTimestamp(),
            "test": true
        ]) { error in
            DispatchQueue.main.async {
                if let error = error {
                    self.testResults["firestore"] = .failure(error.localizedDescription)
                } else {
                    self.testResults["firestore"] = .success
                    // Clean up test document
                    db.collection("test").document("connection").delete { error in
                        if let error = error {
                            print("⚠️  Failed to clean up test document: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
    
    private func testStorage() {
        testResults["storage"] = .pending
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let testRef = storageRef.child("test/connection.txt")
        guard let testData = "Connection test".data(using: .utf8) else {
            DispatchQueue.main.async {
                self.testResults["storage"] = .failure("Could not create test data")
            }
            return
        }
        let metadata = StorageMetadata()
        metadata.contentType = "text/plain"
        
        testRef.putData(testData, metadata: metadata) { metadata, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.testResults["storage"] = .failure(error.localizedDescription)
                } else {
                    self.testResults["storage"] = .success
                    // Clean up test file
                    testRef.delete { error in
                        if let error = error {
                            print("⚠️  Failed to clean up test file: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
    
    private func showTestResults() {
        let successCount = testResults.values.filter { 
            if case .success = $0 { return true }
            return false
        }.count
        
        let totalCount = testResults.count
        
        alertMessage = "Tests completed: \(successCount)/\(totalCount) passed"
        showAlert = true
    }
}

struct TestResultRow: View {
    let service: String
    let result: FirebaseTestView.TestResult
    
    var body: some View {
        HStack {
            Text(service)
            Spacer()
            
            HStack(spacing: 8) {
                Image(systemName: result.icon)
                    .foregroundColor(result.color)
                
                Text(result.description)
                    .font(.caption)
                    .foregroundColor(result.color)
            }
        }
    }
}

#Preview {
    FirebaseTestView()
}
