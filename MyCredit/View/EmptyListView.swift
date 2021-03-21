//
//  EmptyListView.swift
//  MyCredit
//
//  Created by Сергей Смирнов on 16.03.2021.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Image(systemName: "icloud.slash")
                .foregroundColor(Color(.systemGray))
                .font(.system(size: 32))
            Text("No credits")
                .foregroundColor(Color(.systemGray))
            Spacer()
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
