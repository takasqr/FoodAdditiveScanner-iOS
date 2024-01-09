//
//  CameraManager.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/15.
//

import AVFoundation
import SwiftUI

class CameraManager: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    weak var delegate: OutputImageDelegate?
    
    @Published var image: UIImage?
    
    @Published var session = AVCaptureSession()
    
    private let output = AVCapturePhotoOutput()
    
    private let queue = DispatchQueue(label: "cameraQueue")

    override init() {
        super.init()
        setupSession()
        
    }
    
    func setupSession() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        do {
            let input = try AVCaptureDeviceInput(device: device)
            if session.canAddInput(input) && session.canAddOutput(output) {
                session.addInput(input)
                session.addOutput(output)
            }
        } catch {
            print(error.localizedDescription)
            return
        }
        
        // Start the session on a background thread
        queue.async {
            self.session.startRunning()
        }
    }

    func takePhoto() {
        let settings = AVCapturePhotoSettings()
        output.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let data = photo.fileDataRepresentation() else { return }
        if let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.image = image
                
                self.delegate?.outputImage(image)
                
            }
        }
    }
}
