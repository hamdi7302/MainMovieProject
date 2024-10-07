//
//  File.swift
//  MainMovieProject
//
//  Created by hamdi on 7/10/2024.
//

import SwiftUI

struct BackgroundImage: View {
    let image: UIImage?
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .blur(radius: 25)
                .aspectRatio(1.5, contentMode: .fill)
                .overlay(Color.white.opacity(0.2))
                .cornerRadius(12)
        } else {
            LinearGradient(gradient: Gradient(colors: [.gray, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    BackgroundImage(image: UIImage(systemName: "scribble"))  
}
