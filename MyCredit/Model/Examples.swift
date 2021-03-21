//
//  Examples.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 12.02.2021.
//

import Foundation

struct Examples {
    static var credit:CreditItem {
        let _credit = CreditItem(context: PersistenceController.preview.container.viewContext)
        _credit.id = UUID()
        _credit.amount = "10000000"
        _credit.duration = "10"
        _credit.rate = "8.1"
        _credit.payment = "121856.64"
        _credit.overPayment = "4622796.8"
        _credit.timestamp = Date()
        _credit.title = "Test credit"
        
        return _credit
    }
}
