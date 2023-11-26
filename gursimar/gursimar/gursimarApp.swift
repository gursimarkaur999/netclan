//
//  gursimarApp.swift
//  gursimar
//
//  Created by Gursimar on 11/11/23.
//

import SwiftUI

@main
struct gursimarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
