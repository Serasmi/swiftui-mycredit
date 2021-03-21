//
//  CalculateView.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 26.01.2021.
//

import SwiftUI
import CoreData

struct CalculateView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var showAlert = false
    @State var showSavingSheet = false
    
    @State var amount = "12000000"
    @State var duration = 20.0
    @State var rate = "8.1"
    
    var payment: Double {
        guard let _amount = Double(amount), let _rate = Double(rate.replacingOccurrences(of: ",", with: ".")) else {
            return 0
        }
        
        // monthPercents
        let mPs: Double = _rate / 100 / 12
        
        if (mPs == 0) { return 0 }
        
        let months = duration * 12
        
        // coeffitient
        let k: Double = mPs * pow(1 + mPs, months ) / (pow(1 + mPs, months) - 1)
        
        return _amount * k
    }
    
    var overPayment: Double {
        guard let _amount = Double(amount) else {
            return 0
        }
        
        return payment * duration * 12 - _amount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Parameters")) {
                    VStack(alignment: .leading) {
                        Text("Amount").font(.headline)
                        TextField("Credit amount", text: $amount)
                            .keyboardType(.numberPad)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Duration").font(.headline)
                        Stepper(value: $duration, in: 0...30) {
                            Text("\(duration, specifier: "%.f") years")
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Rate").font(.headline)
                        TextField("Credit rate", text: $rate)
                            .keyboardType(.decimalPad)
                    }
                }
                
                Section(header: Text("Result")) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Payment").font(.headline)
                        Text("\(payment, specifier: "%.2f") ₽/month")
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Over payment").font(.headline)
                        Text("\(overPayment, specifier: "%.2f") ₽")
                    }
                }
            }
            .navigationTitle("My credit")
            .navigationBarItems(
                leading: Button(action: {
                    UIApplication.shared.endEditing()
                }, label: {
                    Image(systemName: "checkmark")
                }),
                trailing: Button(action: {
                    showSavingSheet = true
                }, label: {
                    Text("Save")
                }))
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Saved successfully"))
        })
        .sheet(isPresented: $showSavingSheet, content: {
            SavingCreditView(didCreditSave: saveCredit)
        })
    }
    
    private func saveCredit(with title: String) {
        showSavingSheet = false
        
        withAnimation {
            let newItem = CreditItem(context: viewContext)
            newItem.id = UUID()
            newItem.amount = amount
            newItem.duration = String(format: "%.f", duration)
            newItem.rate = rate
            newItem.payment = String(format: "%.2f", payment)
            newItem.overPayment = String(format: "%.2f", overPayment)
            newItem.timestamp = Date()
            newItem.title = title
            
            do {
                try viewContext.save()
                showAlert = true
                // show
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct Calculate_Previews: PreviewProvider {
    static var previews: some View {
        CalculateView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
