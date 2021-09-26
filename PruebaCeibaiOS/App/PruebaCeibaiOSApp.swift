//
//  PruebaCeibaiOSApp.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import SwiftUI

@main
struct PruebaCeibaiOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            UserView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
