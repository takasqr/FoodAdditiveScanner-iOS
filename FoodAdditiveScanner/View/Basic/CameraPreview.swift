//
//  CameraPreview.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/15.
//

import Foundation
import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> some UIView {
        let preview = AVCaptureVideoPreviewLayer(session: session)
        let view = UIView(frame: UIScreen.main.bounds)
        preview.frame = view.frame
        view.layer.addSublayer(preview)
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
