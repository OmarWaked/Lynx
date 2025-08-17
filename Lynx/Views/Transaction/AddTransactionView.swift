import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject var couponManager: CouponManager
    @Environment(\.presentationMode) var presentationMode
    @State private var storeName = ""
    @State private var amount = ""
    @State private var selectedCoupon: Coupon?
    @State private var showCouponPicker = false
    
    private var isFormValid: Bool {
        !storeName.isEmpty && !amount.isEmpty && selectedCoupon != nil
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Transaction Details") {
                    TextField("Store Name", text: $storeName)
                    
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    HStack {
                        Text("Coupon Used")
                        Spacer()
                        Button(selectedCoupon?.name ?? "Select Coupon") {
                            showCouponPicker = true
                        }
                        .foregroundColor(.blue)
                    }
                }
                
                Section {
                    Button("Add Transaction") {
                        addTransaction()
                    }
                    .disabled(!isFormValid)
                }
            }
            .navigationTitle("Add Transaction")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    addTransaction()
                }
                .disabled(!isFormValid)
            )
        }
        .sheet(isPresented: $showCouponPicker) {
            CouponPickerView(selectedCoupon: $selectedCoupon)
        }
    }
    
    private func addTransaction() {
        guard let coupon = selectedCoupon,
              let amountValue = Double(amount) else { return }
        
        couponManager.addTransaction(
            couponId: coupon.barcode,
            storeName: storeName,
            amount: amountValue
        )
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
            .environmentObject(CouponManager())
    }
}
