//
//  SwiftUIStudyApp.swift
//  SwiftUIStudy
//
//  Created by Yeseul Kim on 9/1/21.
//

import SwiftUI

@main
struct SwiftUIStudyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
