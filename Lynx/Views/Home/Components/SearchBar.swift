//
//  SearchBar.swift
//  Lynx
//
//  Created by: Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    let onSearch: () async -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            // Search input field
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.secondary)
                
                TextField("Search coupons...", text: $text)
                    .font(.system(size: 16, weight: .medium))
                    .textFieldStyle(PlainTextFieldStyle())
                    .onSubmit {
                        Task {
                            await onSearch()
                        }
                    }
                
                if !text.isEmpty {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            text = ""
                        }
                        Task {
                            await onSearch()
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.secondary)
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
            )
            .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
            
            // Search button
            Button(action: {
                Task {
                    await onSearch()
                }
            }) {
                Text("Search")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
                    .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
            }
            .disabled(text.isEmpty)
            .opacity(text.isEmpty ? 0.6 : 1.0)
        }
    }
}

#Preview {
    SearchBar(text: .constant(""), onSearch: {})
        .padding()
        .background(Color(.systemGroupedBackground))
}
