//
//  CouponPickerView.swift
//  Lynx
//
//  Created by Omar Waked on 10/22/17.
//  Copyright © 2017 Omar Waked. All rights reserved.
//

import SwiftUI

struct CouponPickerView: View {
    @Binding var selectedCoupon: Coupon?
    @EnvironmentObject var couponManager: CouponManager
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    
    var filteredCoupons: [Coupon] {
        if searchText.isEmpty {
            return couponManager.coupons
        } else {
            return couponManager.coupons.filter { coupon in
                coupon.name.localizedCaseInsensitiveContains(searchText) ||
                coupon.brand.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $searchText, onSearch: {})
                    .padding()
                
                // Coupons List
                List(filteredCoupons) { coupon in
                    Button(action: {
                        selectedCoupon = coupon
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(spacing: 15) {
                            // Coupon Image
                            AsyncImage(url: URL(string: coupon.imageURL)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .overlay(
                                        Image(systemName: "photo")
                                            .font(.title)
                                            .foregroundColor(.gray)
                                    )
                            }
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(8)
                            
                            // Coupon Details
                            VStack(alignment: .leading, spacing: 4) {
                                Text(coupon.brand)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text(coupon.name)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .lineLimit(2)
                                
                                Text(coupon.discount)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            }
                            
                            Spacer()
                            
                            if selectedCoupon?.id == coupon.id {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Select Coupon")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct CouponPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CouponPickerView(selectedCoupon: .constant(nil))
            .environmentObject(CouponManager())
    }
}
