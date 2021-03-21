//
//  UIApplicationExtension.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 21.03.2021.
//

import SwiftUI

#if canImport(UIKit)
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
