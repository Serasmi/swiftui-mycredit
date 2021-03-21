//
//  CreditRowView.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 15.03.2021.
//

import SwiftUI

struct CreditRowView: View {
    let credit: CreditItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            HStack {
                Text("\(credit.amount ?? "0") ₽")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("\(credit.rate ?? "0")%")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.gray)
            }
            Text(credit.title ?? "Без названия")
                .font(.system(size: 14, weight: .light))
            HStack(spacing: 5.0) {
                Text("\(credit.payment ?? "0") ₽/мес")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.gray)
                Spacer()
                Text("\(credit.duration ?? "0")y")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 5)
    }
}

struct CreditRow_Previews: PreviewProvider {
    static var previews: some View {
        CreditRowView(credit: Examples.credit)
    }
}
