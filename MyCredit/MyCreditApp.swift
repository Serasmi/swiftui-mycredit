//
//  MyCreditApp.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 26.01.2021.
//

import SwiftUI

@main
struct MyCreditApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
