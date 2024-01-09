//
//  CameraView.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/15.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraView: View {
    
    @StateObject var scannerViewModel: ScannerViewModel
    
    var cameraManager: CameraManager
    
    @StateObject var cameraManager2: CameraManager = CameraManager()

    @Binding var session: AVCaptureSession
    
    var body: some View {
        ZStack {
            CameraPreview(session: scannerViewModel.cameraManager.session)
                .ignoresSafeArea()

            VStack {
                
                Spacer() // 画面上部にスペースを追加

                HStack {
                    Spacer() // 左側にスペースを追加
                    
                    // シャッターボタン
                    Button(action: {
                        cameraManager.takePhoto()
                    }) {
                        Circle()
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 3)
                                    .frame(width: 74, height: 74)  // overlayのサイズを調整
                            )
                            .frame(width: 80, height: 80) // ボタンのサイズを調整
                    }

                    Spacer()

//                    // 画像プレビューがあれば表示
//                    if let capturedImage = cameraManager.image {
//                        ImagePreviewView(image: capturedImage)
//                            .padding(.trailing)
//                    }
                }
                .frame(height: 100) // シャッターボタンとプレビューのスペースを確保
            }
        }
        .onReceive(cameraManager.$image) { _ in
            // 画像がキャプチャされたときの処理
        }
    }
}
