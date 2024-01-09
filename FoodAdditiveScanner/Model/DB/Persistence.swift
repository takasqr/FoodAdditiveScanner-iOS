//
//  Persistence.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/10/26.
//

import CoreData

struct PersistenceController {
    static var shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FoodAdditiveScanner")
        if inMemory {
            // インメモリストアの場合はURLを/dev/nullに設定
            let storeDescription = NSPersistentStoreDescription()
            storeDescription.url = URL(fileURLWithPath: "/dev/null")
            container.persistentStoreDescriptions = [storeDescription]
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        // ライトウェイトマイグレーション用のオプションを設定
        if !inMemory {
            container.persistentStoreDescriptions.forEach { description in
                description.setOption(true as NSNumber, forKey: NSMigratePersistentStoresAutomaticallyOption)
                description.setOption(true as NSNumber, forKey: NSInferMappingModelAutomaticallyOption)
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    static func reset(inMemory: Bool = false) {
        shared = PersistenceController(inMemory: inMemory)
    }
}
