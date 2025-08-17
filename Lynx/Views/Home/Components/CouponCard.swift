//
//  CouponCard.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct CouponCard: View {
    let coupon: Coupon
    @EnvironmentObject var couponManager: CouponManager
    @State private var showCouponDetail = false
    
    var body: some View {
        Button(action: {
            showCouponDetail = true
        }) {
            HStack(spacing: 16) {
                // Image with modern styling
                ZStack {
                    AsyncImage(url: URL(string: coupon.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ZStack {
                            Color(.systemGray5)
                            Image(systemName: "photo")
                                .font(.system(size: 24, weight: .medium))
                                .foregroundColor(.secondary)
                        }
                    }
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(16)
                    
                    // Bookmark button overlay
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            couponManager.toggleBookmark(for: coupon)
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(.systemBackground))
                                .frame(width: 28, height: 28)
                                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
                            
                            Image(systemName: couponManager.isBookmarked(coupon) ? "bookmark.fill" : "bookmark")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(couponManager.isBookmarked(coupon) ? .blue : .secondary)
                        }
                    }
                    .offset(x: 30, y: -30)
                }
                
                // Content section
                VStack(alignment: .leading, spacing: 8) {
                    // Brand and name
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(coupon.brand)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.blue)
                                .textCase(.uppercase)
                                .tracking(0.5)
                            
                            Spacer()
                        }
                        
                        Text(coupon.name)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                    }
                    
                    // Discount and expiration
                    HStack {
                        // Discount badge
                        Text(coupon.discount)
                            .font(.system(size: 16, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.green, Color.green.opacity(0.8)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                        
                        Spacer()
                        
                        // Expiration status
                        HStack(spacing: 4) {
                            Image(systemName: coupon.isExpired ? "exclamationmark.triangle.fill" : "clock.fill")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(coupon.isExpired ? .red : .orange)
                            
                            Text(coupon.isExpired ? "Expired" : "\(coupon.daysUntilExpiration) days")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(coupon.isExpired ? .red : .orange)
                        }
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(
                            Capsule()
                                .fill(coupon.isExpired ? Color.red.opacity(0.1) : Color.orange.opacity(0.1))
                        )
                    }
                }
                
                Spacer()
                
                // Chevron indicator
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 6)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.systemGray5), lineWidth: 0.5)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(showCouponDetail ? 0.98 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: showCouponDetail)
        .sheet(isPresented: $showCouponDetail) {
            CouponDetailView(coupon: coupon)
        }
    }
}

struct CouponCard_Previews: PreviewProvider {
    static var previews: some View {
        CouponCard(coupon: Coupon(
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
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}
