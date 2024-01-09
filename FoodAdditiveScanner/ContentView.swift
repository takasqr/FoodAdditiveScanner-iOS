//
//  ContentView.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/10/26.
//

import SwiftUI
import CoreData
import AVFoundation

struct ContentView: View {
        
    @Environment(\.managedObjectContext) private var viewContext
    
    private let dataVersion = 13
    
    var body: some View {
        
        NavigationView {
            
            IdlingPage()
        }
        .navigationViewStyle(.stack)
        .onAppear {
            
            checkDataVersion()
        }
    }
    
    private func checkDataVersion() {
        
        // バージョンが上がっていたら
        if SystemSetting.dataVersion < self.dataVersion {
            
            do {
                // CoreData に書き込む
                let foodAdditiveEntity = FoodAdditiveEntity()
                
                try foodAdditiveEntity.physicalDeleteAll()
                
                for foodAdditive in FoodAdditive.getFoodAdditives() {
                    
                    try foodAdditiveEntity.add(foodAdditive: foodAdditive)
                    
                    print(foodAdditive.name, foodAdditive.descriptionText)
                }
                
                // バージョンを上げる
                SystemSetting.dataVersion = self.dataVersion
            } catch {
                
                print(error)
            }
        } else {
            print("DataVersionは最新でした")
        }
    }
}

//#Preview {
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
