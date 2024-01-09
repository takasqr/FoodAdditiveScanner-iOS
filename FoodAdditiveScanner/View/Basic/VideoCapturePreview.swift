//
//  VideoCapturePreview.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/04.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation

struct VideoCapturePreview: UIViewRepresentable {
    let session: AVCaptureSession
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        // カメラセッションをプレビューに設定
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
