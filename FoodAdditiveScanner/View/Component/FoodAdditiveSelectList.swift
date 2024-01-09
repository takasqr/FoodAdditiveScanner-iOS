//
//  FoodAdditiveSelectList.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/20.
//

import SwiftUI

struct FoodAdditiveSelectList: View {
    
    @Binding var inputText: String
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \CoreDataFoodAdditive.name, ascending: true)], animation: .default)
    
    private var coreDataFoodAdditives: FetchedResults<CoreDataFoodAdditive>
    
    var body: some View {
        VStack {
            List {
                ForEach(coreDataFoodAdditives) { coreDataFoodAdditive in

                    NavigationLink(destination: FoodAdditivePage(foodAdditive: FoodAdditive.get(name: coreDataFoodAdditive.name ?? ""))) {
                        HStack {
                            Text(coreDataFoodAdditive.name ?? "")
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .searchable(text: $inputText, placement: .navigationBarDrawer(displayMode: .always), prompt: "検索")
        
        .onChange(of: inputText, perform: { newValue in
            search(text: newValue)
        })
        .onDisappear {
            //
            inputText = ""
            coreDataFoodAdditives.nsPredicate = nil
        }
    }
    
    /// 検索用テキストフィールドに入力されたら都度検索を実行
    private func search(text: String) {
        
        if text.isEmpty {
            coreDataFoodAdditives.nsPredicate = nil
        } else {
            
            let namePredicate: NSPredicate = NSPredicate(format: "name contains %@", text)
            
            coreDataFoodAdditives.nsPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [namePredicate])
        }
    }
}

//#Preview {
//    FoodAdditiveSelectList()
//}
