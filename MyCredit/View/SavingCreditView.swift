//
//  SavingCreditView.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 15.03.2021.
//

import SwiftUI

struct SavingCreditView: View {
    @State var showAlert = false
    @State var title = ""
    
    var didCreditSave: (_ title: String) -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Text("You should enter credit title for saving")
                .foregroundColor(Color(.systemGray))
            TextField("Enter credit title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                if (title.count > 0) {
                    didCreditSave(title)
                } else {
                    showAlert = true
                }
            }, label: {
                Text("Save")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.white)
            })
            .frame(height: 40)
            .padding(.horizontal)
            .background(Color(.systemBlue))
            .cornerRadius(4)
        }
        .padding(.horizontal)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Credit title can't be empty!"))
        })
    }
}

struct SavingCreditView_Previews: PreviewProvider {
    static var previews: some View {
        SavingCreditView(didCreditSave: {_ in})
    }
}
