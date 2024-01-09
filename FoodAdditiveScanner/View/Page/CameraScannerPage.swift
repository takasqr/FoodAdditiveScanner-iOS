//
//  CameraScannerPage.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/05.
//

import SwiftUI

struct CameraScannerPage: View {
    
    @StateObject var scannerViewModel = ScannerViewModel()
    
    var body: some View {
        
        ZStack {
            ScannerView(cameraManager: scannerViewModel.cameraManager,
                        videoCaptureManager: scannerViewModel.videoCaptureManager,
                        scannerViewModel: scannerViewModel, showResult: $scannerViewModel.showResult,
                        result: $scannerViewModel.result,
                        session: $scannerViewModel.cameraManager.session)
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: BookPage()) {
                        Image(systemName: "book.fill")
                            .resizable() // resizableを追加
                            .frame(width: 30, height: 30) // frameでサイズを指定
                            .foregroundColor(.white)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 40)
                    }
                    
                    NavigationLink(destination: SettingPage()) {
                        Image(systemName: "gearshape.fill")
                            .resizable() // resizableを追加
                            .frame(width: 30, height: 30) // frameでサイズを指定
                            .foregroundColor(.white)
                            .padding(.vertical, 50)
                            .padding(.horizontal, 40)
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    CameraScannerPage()
}
