//
//  EntityManager.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/19.
//

import Foundation
import CoreData

class EntityManager {
    
    let context: NSManagedObjectContext
    // initで_entityNameを設定 → entityNameをgetで設定
    // readonlyにする
    private var _entityName: String = ""
    
    var entityName: String {
        get {
            return _entityName
        }
    }
    // entityを柔軟に受け入れるためにジェネリクスを使用
    // バックグラウンド用の context も受け入れることが出来るように
    init<T>(entity entityType: T, context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        let typeName = String(describing: T.self)
        
        // エンティティ名を設定
        self._entityName = String(typeName[typeName.startIndex..<typeName.firstIndex(of: ".")!])
        
        self.context = context
        // let persistenceController = PersistenceController.shared
        // self.context = persistenceController.container.viewContext
    }
    
    func count() throws -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        let count = try context.count(for: fetchRequest)
        return count
    }
}
