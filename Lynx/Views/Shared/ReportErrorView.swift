//
//  ReportErrorView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct ReportErrorView: View {
    let coupon: Coupon
    @Environment(\.presentationMode) var presentationMode
    @State private var errorType = "Incorrect Information"
    @State private var description = ""
    @State private var showSuccessMessage = false
    
    private let errorTypes = [
        "Incorrect Information",
        "Expired Coupon",
        "Invalid Barcode",
        "Wrong Price",
        "Other"
    ]
    
    private var isFormValid: Bool {
        !description.isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Coupon Information") {
                    HStack {
                        Text("Coupon")
                        Spacer()
                        Text(coupon.name)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Brand")
                        Spacer()
                        Text(coupon.brand)
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Report Details") {
                    Picker("Error Type", selection: $errorType) {
                        ForEach(errorTypes, id: \.self) { type in
                            Text(type).tag(type)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        TextEditor(text: $description)
                            .frame(minHeight: 100)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                
                Section {
                    Button("Submit Report") {
                        submitReport()
                    }
                    .disabled(!isFormValid)
                }
                
                if showSuccessMessage {
                    Section {
                        Text("Thank you for your report. We'll review it and take appropriate action.")
                            .foregroundColor(.green)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("Report Error")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Submit") {
                    submitReport()
                }
                .disabled(!isFormValid)
            )
        }
    }
    
    private func submitReport() {
        // TODO: Implement actual error reporting to backend
        showSuccessMessage = true
        
        // Hide success message and dismiss after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showSuccessMessage = false
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ReportErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ReportErrorView(coupon: Coupon(
            barcode: "123456789",
            brand: "Nike",
            category: "Sports",
            subcategory: "Shoes",
            discount: "20% OFF",
            expiration: "12/31/2024",
            imageURL: "",
            name: "Running Shoes Discount",
            terms: "Valid on select items",
            discountType: true,
            companyName: "Nike",
            companyCUID: "nike123"
        ))
    }
}
