//
//  ScannerView.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/05.
//

import SwiftUI
import AVFoundation

struct ScannerView: View {
    
    @State var isSilentMode = false
    
    @StateObject var cameraManager: CameraManager
    
    @StateObject var videoCaptureManager: VideoCaptureManager
    
    @StateObject var scannerViewModel: ScannerViewModel
    
    @Binding var showResult: Bool
    
    @Binding var result: [String]
    
    @Binding var session: AVCaptureSession
    
    var body: some View {
        VStack {
//            if isSilentMode {
                // サイレントモードだったら
//                VideoCaptureView(videoCaptureManager: videoCaptureManager)
//            } else {
//
            CameraView(scannerViewModel: scannerViewModel, cameraManager: cameraManager, session: $session)
//            }
        }
        .onAppear {
            isSilentMode = UserSetting.isSilentMode
        }
//        .sheet(isPresented: $showResult) {
//            ResultSheet(result: $result)
//        }
    }
}

//#Preview {
//    ScannerView()
//}
