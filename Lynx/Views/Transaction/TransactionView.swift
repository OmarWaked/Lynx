import SwiftUI

struct TransactionView: View {
    @EnvironmentObject var couponManager: CouponManager
    @State private var showAddTransaction = false
    
    var body: some View {
        NavigationView {
            Group {
                if couponManager.transactions.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "cart.badge.plus")
                            .font(.system(size: 60))
                            .foregroundColor(.secondary)
                        
                        Text("No Transactions Yet")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Start using coupons to see your transaction history here.")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                        Button("Add Transaction") {
                            showAddTransaction = true
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(couponManager.transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: Button("Add") {
                showAddTransaction = true
            })
            .refreshable {
                await couponManager.fetchTransactions()
            }
        }
        .sheet(isPresented: $showAddTransaction) {
            AddTransactionView()
        }
    }
}

#Preview {
    TransactionView()
        .environmentObject(CouponManager())
}
