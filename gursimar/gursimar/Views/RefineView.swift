//
//  RefineView.swift
//  gursimar
//
//  Created by Gursimar on 20/11/23.
//

import SwiftUI
enum joinAs: String, CaseIterable {
    case Individual
    case Professional
    case Merchant
}
struct RefineView: View {
    var getJoinAsMenuItem: (String, String, String) -> JoinAsMenuItem = { imageName, optionName, optionDescription in
        return JoinAsMenuItem(imageName: imageName, optionName: optionName, optionDescription: optionDescription)
    }

    var body: some View {
        Spacer()
        Text("Join As").font(.system(size: 29.0))
        Spacer()
        VStack(spacing:50) {
            RefineRow(item: getJoinAsMenuItem("person", "Individual", "Join and build read time community"))
            RefineRow(item: getJoinAsMenuItem("person", "Professional", "World's largest real time services community"))
            RefineRow(item: getJoinAsMenuItem("person", "Merchant", "World's largest real time merchant's community"))
        }
        Spacer()
    }
}

#Preview {
    RefineView()
}
