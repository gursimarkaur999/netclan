//
//  ExploreTabBar.swift
//  gursimar
//
//  Created by Gursimar on 17/11/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case Refine
    case Explore
    case Network
    case Chat
    case Contacts
}
var tabImagesDictionary = [
    Tab.Refine: "list.bullet.rectangle",
    Tab.Explore: "eye",
    Tab.Network: "person.3",
    Tab.Chat: "bubble.left.and.text.bubble.right",
    Tab.Contacts: "person.2.crop.square.stack"
]


struct ExploreTabBar: View {
    @Binding var selectedTab: Tab
    private var filledImage: String {
        tabImagesDictionary[selectedTab]! + ".fill"
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    VStack {
                        Image(systemName: selectedTab == tab ? filledImage : tabImagesDictionary[tab]!)
                            .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                            .font(.system(size: 19.0))
                        Text(tab.rawValue).font(.system(size: 13.0))
                    }.foregroundStyle(selectedTab == tab ? Color(hue: 201.0, saturation: 83.0, brightness: 25.0) : Color.gray.opacity(1.0)).onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            // If you intended to change selectedTab when tapped, use an assignment
                            selectedTab = tab
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
        }.overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .top)
    }
}

#Preview {
    ExploreTabBar(selectedTab: .constant(.Explore))
}
