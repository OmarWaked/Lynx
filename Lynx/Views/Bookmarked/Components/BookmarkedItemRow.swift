import SwiftUI

struct BookmarkedItemRow: View {
    let bookmarkedItem: BookmarkedItem
    @EnvironmentObject var couponManager: CouponManager
    @State private var showCouponDetail = false
    
    var body: some View {
        Button(action: {
            showCouponDetail = true
        }) {
            HStack(spacing: 15) {
                // Coupon Image
                AsyncImage(url: URL(string: bookmarkedItem.imageURL)) { image in
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
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(8)
                
                // Coupon Details
                VStack(alignment: .leading, spacing: 4) {
                    Text(bookmarkedItem.brand)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Text(bookmarkedItem.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    
                    HStack {
                        Text(bookmarkedItem.discount)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        
                        Spacer()
                        
                        Text(bookmarkedItem.dateBookmarked, style: .date)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                // Remove Bookmark Button
                Button(action: {
                    // Convert BookmarkedItem back to Coupon for removal
                    let coupon = Coupon(
                        barcode: bookmarkedItem.barcode,
                        brand: bookmarkedItem.brand,
                        category: bookmarkedItem.category,
                        subcategory: bookmarkedItem.subcategory,
                        discount: bookmarkedItem.discount,
                        expiration: bookmarkedItem.expiration,
                        imageURL: bookmarkedItem.imageURL,
                        name: bookmarkedItem.name,
                        terms: bookmarkedItem.terms,
                        discountType: bookmarkedItem.discountType,
                        companyName: "",
                        companyCUID: ""
                    )
                    couponManager.toggleBookmark(for: coupon)
                }) {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.red)
                }
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $showCouponDetail) {
            // Convert BookmarkedItem back to Coupon for detail view
            let coupon = Coupon(
                barcode: bookmarkedItem.barcode,
                brand: bookmarkedItem.brand,
                category: bookmarkedItem.category,
                subcategory: bookmarkedItem.subcategory,
                discount: bookmarkedItem.discount,
                expiration: bookmarkedItem.expiration,
                imageURL: bookmarkedItem.imageURL,
                name: bookmarkedItem.name,
                terms: bookmarkedItem.terms,
                discountType: bookmarkedItem.discountType,
                companyName: "",
                companyCUID: ""
            )
            CouponDetailView(coupon: coupon)
        }
    }
}

struct BookmarkedItemRow_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkedItemRow(bookmarkedItem: BookmarkedItem(
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
            dateBookmarked: Date()
        ))
        .environmentObject(CouponManager())
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
