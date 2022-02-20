//
//  CupcakeCornerApp.swift
//  CupcakeCorner
//
//  Created by Bünyamin Kılıçer on 10.02.2022.
//

import SwiftUI

@main
struct CupcakeCornerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
