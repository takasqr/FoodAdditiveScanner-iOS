//
//  VideoScannerPage.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/07.
//

import SwiftUI

struct VideoScannerPage: View {
    
    @StateObject var videoScannerViewModel = VideoScannerViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            VStack {
                CameraPreview(session: videoScannerViewModel.videoCaptureManager.captureSession)
                    .ignoresSafeArea()
            }
            
            VStack {
                    
                HStack {
                    
                    Image(systemName: "xmark")
                        .resizable() // resizableを追加
                        .frame(width: 30, height: 30) // frameでサイズを指定
                        .foregroundColor(.gray)
                        .padding(.vertical, 30)
                        .padding(.horizontal, 40)
                        .onTapGesture {
                            dismiss()
                        }
                    
                    Spacer()
                    
//                    NavigationLink(destination: BookPage()) {
//                        Image(systemName: "book.fill")
//                            .resizable() // resizableを追加
//                            .frame(width: 30, height: 30) // frameでサイズを指定
//                            .foregroundColor(.white)
//                            .padding(.vertical, 30)
//                            .padding(.horizontal, 40)
//                    }
                        
//                        NavigationLink(destination: SettingPage()) {
//                            Image(systemName: "gearshape.fill")
//                                .resizable() // resizableを追加
//                                .frame(width: 30, height: 30) // frameでサイズを指定
//                                .foregroundColor(.white)
//                                .padding(.vertical, 50)
//                                .padding(.horizontal, 40)
//                        }
                }
                
                Spacer() // 画面上部にスペースを追加

                HStack {
                    Spacer() // 左側にスペースを追加
                    
                    // シャッターボタン
                    Button(action: {
                        videoScannerViewModel.takePhoto()
                    }) {
                        Circle()
                            .fill(Color.white)
                            .overlay(
                                Circle()
                                    .stroke(.black, lineWidth: 3)
//                                    .stroke(Color(red: 164/255, green: 19/255, blue: 122/255), lineWidth: 3)
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
        .navigationBarHidden(true)
        .sheet(isPresented: $videoScannerViewModel.showResult) {
            ResultSheet(result: $videoScannerViewModel.result)
        }
    }
}

#Preview {
    VideoScannerPage()
}
