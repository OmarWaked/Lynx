//
//  CouponDetailView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct CouponDetailView: View {
    let coupon: Coupon
    @EnvironmentObject var couponManager: CouponManager
    @Environment(\.presentationMode) var presentationMode
    @State private var showShareSheet = false
    @State private var showReportError = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Coupon Image
                    AsyncImage(url: URL(string: coupon.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            )
                    }
                    .frame(maxHeight: 300)
                    .cornerRadius(16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        // Header Info
                        VStack(alignment: .leading, spacing: 8) {
                            Text(coupon.brand)
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .textCase(.uppercase)
                            
                            Text(coupon.name)
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(coupon.discount)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        
                        Divider()
                        
                        // Details
                        VStack(alignment: .leading, spacing: 12) {
                            DetailRow(icon: "tag", title: "Category", value: coupon.category)
                            DetailRow(icon: "tag.fill", title: "Subcategory", value: coupon.subcategory)
                            DetailRow(icon: "building.2", title: "Company", value: coupon.companyName)
                            DetailRow(icon: "calendar", title: "Expires", value: coupon.expiration)
                            
                            if !coupon.terms.isEmpty {
                                DetailRow(icon: "doc.text", title: "Terms", value: coupon.terms)
                            }
                        }
                        
                        Divider()
                        
                        // Barcode
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Barcode")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            Text(coupon.barcode)
                                .font(.title3)
                                .fontWeight(.medium)
                                .font(.system(.title3, design: .monospaced))
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                        }
                        
                        // Action Buttons
                        VStack(spacing: 12) {
                            Button(action: {
                                Task {
                                    await couponManager.toggleBookmark(for: coupon)
                                }
                            }) {
                                HStack {
                                    Image(systemName: couponManager.isBookmarked(coupon) ? "bookmark.fill" : "bookmark")
                                    Text(couponManager.isBookmarked(coupon) ? "Remove Bookmark" : "Add to Bookmarks")
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(couponManager.isBookmarked(coupon) ? Color.red : Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                            
                            HStack(spacing: 12) {
                                Button(action: {
                                    showShareSheet = true
                                }) {
                                    HStack {
                                        Image(systemName: "square.and.arrow.up")
                                        Text("Share")
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                                
                                Button(action: {
                                    showReportError = true
                                }) {
                                    HStack {
                                        Image(systemName: "exclamationmark.triangle")
                                        Text("Report")
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.orange)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Coupon Details")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: [coupon.name, coupon.discount])
        }
        .sheet(isPresented: $showReportError) {
            ReportErrorView(coupon: coupon)
        }
    }
}

struct DetailRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 20)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

#Preview {
    CouponDetailView(coupon: Coupon(
        barcode: "123456789",
        brand: "Nike",
        category: "Sports",
        subcategory: "Shoes",
        discount: "20% OFF",
        expiration: "12/31/2024",
        imageURL: "https://example.com/image.jpg",
        name: "20% Off Running Shoes",
        terms: "Valid until December 31, 2024",
        discountType: true,
        companyName: "Nike",
        companyCUID: "nike123"
    ))
    .environmentObject(CouponManager())
}
