import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(spacing: 15) {
            // Transaction Icon
            Image(systemName: "cart.circle.fill")
                .font(.title2)
                .foregroundColor(.blue)
            
            // Transaction Details
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.storeName)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(transaction.dateUsed, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Amount
            Text("$\(String(format: "%.2f", transaction.amount))")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: Transaction(
            couponId: "123",
            dateUsed: Date(),
            storeName: "Walmart",
            amount: 25.99
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
