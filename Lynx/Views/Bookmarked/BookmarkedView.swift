import SwiftUI

struct BookmarkedView: View {
    @EnvironmentObject var couponManager: CouponManager
    
    var body: some View {
        NavigationView {
            Group {
                if couponManager.bookmarkedItems.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "bookmark")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        
                        Text("No Bookmarked Coupons")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Start bookmarking coupons to see them here for quick access.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(couponManager.bookmarkedItems) { bookmarkedItem in
                            BookmarkedItemRow(bookmarkedItem: bookmarkedItem)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Bookmarks")
            .navigationBarTitleDisplayMode(.large)
            .refreshable {
                couponManager.fetchBookmarkedItems()
            }
        }
    }
}

struct BookmarkedView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkedView()
            .environmentObject(CouponManager())
    }
}
