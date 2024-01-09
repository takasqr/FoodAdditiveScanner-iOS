//
//  FoodAdditiveEntity.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/19.
//

import Foundation
import CoreData

class FoodAdditiveEntity: EntityManager {
    init() {
        super.init(entity: CoreDataFoodAdditive.self)
    }
    
    func add(foodAdditive: FoodAdditive) throws {
        
        let validated = foodAdditive.validate()
        
        if validated.isValid {
            
            do {
                // FoodAdditiveのデータをCoreDataFoodAdditiveにセット
                self.setCoreDataModel(foodAdditive: foodAdditive)
                
                try context.save()
            } catch {
                throw error
            }
            
        } else {
            // バリデーションの結果をエラーとして投げる
            throw CustomError.validationError(reason: validated.validationMessage)
        }
    }
    
    private func setCoreDataModel(foodAdditive: FoodAdditive) {
        
        print(FoodAdditiveUsage.getCoreDataString(foodAdditive.usage))
        
        let coreDataFoodAdditive = CoreDataFoodAdditive(context: context)
        
        coreDataFoodAdditive.name = foodAdditive.name
        coreDataFoodAdditive.descriptionText = foodAdditive.descriptionText
        coreDataFoodAdditive.usage = FoodAdditiveUsage.getCoreDataString(foodAdditive.usage)
        coreDataFoodAdditive.type = foodAdditive.type.toCoreData()
        coreDataFoodAdditive.keywords = StringTool.convertArrayToJSONString(foodAdditive.keywords)
        
    }
    
    func physicalDeleteAll() throws {
        // https://developer.apple.com/documentation/coredata/nsbatchdeleterequest
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        try context.execute(deleteRequest)
        try context.save()
    }
    
    func get(name: String) throws -> FoodAdditive? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName)
        
        // 検索条件を指定　テーブルのキーで検索する
        var predicates = [NSPredicate]()
        predicates.append(NSPredicate(format: "name == %@", name))
        
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        
        var result: FoodAdditive?
        do {
            if let value = try context.fetch(request) as? [CoreDataFoodAdditive] {
                
                if let firstData = value.first {
                    result = FoodAdditive.fromCoreDataToModel(coreDataFoodAdditive: firstData)
                }
            }
        } catch {
            throw error
        }
        return result
    }
}
