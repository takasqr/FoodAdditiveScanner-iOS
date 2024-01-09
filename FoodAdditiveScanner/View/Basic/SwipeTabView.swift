//
//  SwipeTabView.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/20.
//

import Foundation
import SwiftUI

struct SwipeTabView: View {
    
    let list: [String]
    
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< list.count, id: \.self) { value in
                Button(action: {
                    withAnimation {
                        selectedTab = value
                    }
                }, label: {
                    VStack {
                        HStack {
                            Text(list[value])
                                .foregroundColor(Color.primary)
                                .bold()
                        }
                        .frame(width: (UIScreen.main.bounds.width / CGFloat(list.count)), height: 48 - 6)
                        
                        Rectangle()
                            .fill(selectedTab == value ? Color.green: Color.clear)
                            .frame(height: 6)
                    }
                    .fixedSize()
                })
            }
        }
        .compositingGroup()
    }
}
