//
//  ImagePreviewView.swift
//  FoodAdditiveScanner
//
//  Created by takasqr on 2023/11/15.
//

import SwiftUI

struct ImagePreviewView: View {
    let image: UIImage
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 70, height: 70) // このサイズはシャッターボタンと同じくらいに調整します。
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
    }
}
