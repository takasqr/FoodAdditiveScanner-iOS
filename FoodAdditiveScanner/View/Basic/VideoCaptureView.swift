//
//  VideoCaptureView.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/06.
//

import SwiftUI

struct VideoCaptureView: View {
    
    @StateObject var videoCaptureManager: VideoCaptureManager
    
    var body: some View {
        ZStack {
            VideoCapturePreview(session: videoCaptureManager.captureSession)
        }
    }
}

//#Preview {
//    VideoCaptureView()
//}
