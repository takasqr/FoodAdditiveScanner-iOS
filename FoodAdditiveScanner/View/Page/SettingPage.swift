//
//  SettingPage.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/05.
//

import SwiftUI

struct SettingPage: View {
    
    @AppStorage("isSilentModeKey") private var isSilentMode: Bool = false

    var body: some View {
        Form {
            Toggle("シャッターボタンなし", isOn: $isSilentMode)
                .onChange(of: isSilentMode) { newValue in
                    
                    print(newValue)
                    
                    UserSetting.isSilentMode = newValue
                }
        }
    }
}

#Preview {
    SettingPage()
}
