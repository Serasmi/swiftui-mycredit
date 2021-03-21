//
//  ContentViewNew.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 26.01.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CalculateView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Calculate")
                }
                .tag(0)
            
            CreditsListView(onAddCredit: onAddCredit)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Credits")
                }
                .tag(1)
        }
    }
    
    func onAddCredit() {
        selectedTab = 0
    }
}

struct ContentViewNew_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
