//
//  FeaturedCouponCard.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct FeaturedCouponCard: View {
    let coupon: Coupon
    @EnvironmentObject var couponManager: CouponManager
    @State private var showCouponDetail = false
    
    var body: some View {
        Button(action: {
            showCouponDetail = true
        }) {
            VStack(alignment: .leading, spacing: 0) {
                // Image with modern styling
                ZStack(alignment: .topTrailing) {
                    AsyncImage(url: URL(string: coupon.imageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ZStack {
                            Color(.systemGray5)
                            Image(systemName: "photo")
                                .font(.system(size: 30, weight: .medium))
                                .foregroundColor(.secondary)
                        }
                    }
                    .frame(width: 280, height: 160)
                    .clipped()
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                    
                    // Bookmark button overlay
                    Button(action: {
                        Task<Void, Never> {
                            await couponManager.toggleBookmark(for: coupon)
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(.systemBackground))
                                .frame(width: 36, height: 36)
                                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                            
                            Image(systemName: couponManager.isBookmarked(coupon) ? "bookmark.fill" : "bookmark")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(couponManager.isBookmarked(coupon) ? .blue : .secondary)
                        }
                    }
                    .padding(.top, 12)
                    .padding(.trailing, 12)
                }
                
                // Content section
                VStack(alignment: .leading, spacing: 12) {
                    // Brand and name
                    VStack(alignment: .leading, spacing: 6) {
                        Text(coupon.brand)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.blue)
                            .textCase(.uppercase)
                            .tracking(0.5)
                        
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
                            .font(.system(size: 20, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.green, Color.green.opacity(0.8)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(12)
                        
                        Spacer()
                        
                        // Expiration status
                        HStack(spacing: 4) {
                            Image(systemName: coupon.isExpired ? "exclamationmark.triangle.fill" : "clock.fill")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(coupon.isExpired ? .red : .orange)
                            
                            Text(coupon.isExpired ? "Expired" : "\(coupon.daysUntilExpiration) days left")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(coupon.isExpired ? .red : .orange)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(coupon.isExpired ? Color.red.opacity(0.1) : Color.orange.opacity(0.1))
                        )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.systemGray5), lineWidth: 0.5)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(showCouponDetail ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: showCouponDetail)
        .sheet(isPresented: $showCouponDetail) {
            CouponDetailView(coupon: coupon)
        }
    }
}

// Extension for rounded corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    FeaturedCouponCard(coupon: Coupon(
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
    .frame(width: 300)
    .padding()
    .background(Color(.systemGroupedBackground))
}
