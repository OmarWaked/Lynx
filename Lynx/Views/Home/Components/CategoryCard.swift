//
//  CategoryCard.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct CategoryCard: View {
    let category: Category
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 16) {
                // Image with modern styling
                ZStack {
                    AsyncImage(url: URL(string: category.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.blue.opacity(0.1),
                                    Color.purple.opacity(0.1)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            
                            Image(systemName: "tag.fill")
                                .font(.system(size: 30, weight: .medium))
                                .foregroundColor(.blue)
                        }
                    }
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(16)
                    
                    // Gradient overlay for better text readability
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.clear,
                            Color.black.opacity(0.3)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .cornerRadius(16)
                }
                
                // Category name
                Text(category.name)
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.08), radius: 15, x: 0, y: 8)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.systemGray5), lineWidth: 0.5)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(0.98)
        .animation(.easeInOut(duration: 0.1), value: true)
    }
}

#Preview {
    CategoryCard(category: Category(
        name: "Sports",
        imageURL: "https://example.com/sports.jpg"
    ), onTap: {
        print("Category tapped")
    })
    .frame(width: 150, height: 100)
    .padding()
    .background(Color(.systemGroupedBackground))
}
