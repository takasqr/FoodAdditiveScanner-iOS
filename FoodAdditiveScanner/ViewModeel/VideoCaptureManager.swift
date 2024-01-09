//
//  VideoCaptureManager.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/12/04.
//

import AVFoundation
import SwiftUI

class VideoCaptureManager: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    weak var delegate: OutputImageDelegate?
    
    let captureSession = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()

    override init() {
        super.init()
        setupCaptureSession()
    }

    private func setupCaptureSession() {
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let videoInput = try? AVCaptureDeviceInput(device: videoCaptureDevice) else { return }

        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        }

        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        }

        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // ここでCMSampleBufferから画像を取得
        
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let ciImage = CIImage(cvImageBuffer: imageBuffer)
        let context = CIContext()

        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        // ここでUIImageが使用できる
        
        delegate?.outputImage(uiImage)
    }
}
