//
//  CreditDetailsView.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 12.02.2021.
//

import SwiftUI

struct CreditDetailsView: View {
    let credit: CreditItem

    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Parameters")) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Amount").font(.headline)
                        Text("\(Double(credit.amount ?? "0")!, specifier: "%.f")")
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Duration").font(.headline)
                        Text("\(Double(credit.duration ?? "0")!, specifier: "%.f") years")
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Rate").font(.headline)
                        Text("\(credit.rate ?? "0")%")
                    }
                }
                
                Section(header: Text("Calculated")) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Payment").font(.headline)
                        Text("\(Double(credit.payment ?? "0")!, specifier: "%.2f") ₽/month")
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Over payments").font(.headline)
                        Text("\(Double(credit.overPayment ?? "0")!, specifier: "%.2f") ₽")
                    }
                }
            }
            .navigationTitle("Credit")
        }
    }
}

struct CreditDetails_Previews: PreviewProvider {
    static var previews: some View {
        CreditDetailsView(credit: Examples.credit)
    }
}
