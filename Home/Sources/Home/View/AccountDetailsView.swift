//
//  AccountDetailsView.swift
//  Home
//
//  Created by MAdelAref on 09/05/2025.
//

import SwiftUI

struct AccountDetailsView: View {
    // Static data for the account
    let account = AccountDetailsModel(
        accountName: "John Doe",
        accountNumber: "1234567890",
        balance: 5000.75,
        email: "johndoe@example.com",
        phoneNumber: "+1234567890"
    )
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Account Name
            Text("Account Name: \(account.accountName)")
                .font(.title)
                .fontWeight(.bold)
            
            // Account Number
            Text("Account Number: \(account.accountNumber)")
                .font(.body)
                .foregroundColor(.gray)
            
            // Account Balance
            Text("Balance: $\(String(format: "%.2f", account.balance))")
                .font(.body)
                .foregroundColor(.green)
            
            // Email Address
            Text("Email: \(account.email)")
                .font(.body)
                .foregroundColor(.blue)
            
            // Phone Number
            Text("Phone: \(account.phoneNumber)")
                .font(.body)
                .foregroundColor(.blue)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Account Details", displayMode: .inline)
    }
}

struct AccountDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailsView()
    }
}
