//
//  CreditsListView.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 03.02.2021.
//

import SwiftUI

struct CreditsListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CreditItem.timestamp, ascending: true)],
        animation: .default)
    private var creditItems: FetchedResults<CreditItem>
    
    @State var selectedCredit: CreditItem?
    
    var onAddCredit: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                if creditItems.count == 0 {
                    EmptyListView()
                } else {
                    List {
                        ForEach(creditItems) { credit in
                            CreditRowView(credit: credit)
                                .onTapGesture(perform: {
                                    selectedCredit = credit
                                })
                        }
                        .onDelete(perform: deleteCredits)
                    }
                }
            }
            .navigationTitle("Credits")
            .toolbar(content: {
                Button(action: onAddCredit, label: {
                    Label("Add Item", systemImage: "plus")
                })
            })
        }
        .sheet(item: $selectedCredit) { credit in
            CreditDetailsView(credit: credit)
        }
    }
    
    func deleteCredits(at offsets: IndexSet) {
        withAnimation {
            offsets.map { creditItems[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct CreditsListView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsListView(onAddCredit: {})
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
