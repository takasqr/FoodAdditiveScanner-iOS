//
//  FoodAdditiveScannerApp.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/10/26.
//

import SwiftUI

@main
struct FoodAdditiveScannerApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
