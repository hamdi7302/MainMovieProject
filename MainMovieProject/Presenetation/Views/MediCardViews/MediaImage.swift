//
//  File.swift
//  MainMovieProject
//
//  Created by hamdi on 7/10/2024.
//
import SwiftUI

struct MediaImage: View {
    @ObservedObject var viewModel: MediaCardViewModel
    
    var body: some View {
        
        
        if let image = viewModel.image {
            Image(uiImage: image)
                .resizable()
                .imageScale(.large)
                .overlay {
                    if viewModel.showActions {
                        PlayButtonOverlay(viewModel: viewModel)
                    }
                    
                }
                .cornerRadius(12)
              
            
        }else{
            Rectangle()
                .foregroundStyle(Color.gray)
                .overlay {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                .cornerRadius(12)
        }
    }
}

struct PlayButtonOverlay: View {
    @State var scale: CGFloat = 1
    @ObservedObject var viewModel: MediaCardViewModel
    
    var body: some View {
        ZStack {
            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(Animation.smooth(duration: 1).repeatForever(autoreverses: true)) {
                        scale = 1.1
                    }
                }.onTapGesture(perform: {
                    viewModel.showVideo =  true
                })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3))
    }
}
#Preview {
    MediaImage(viewModel: MediaCardViewModel(index: 5, resultCard: Movie(id: 12, originalTitle: "", overview: "", popularity: 10, realeaseDate: "", mediaType: "", genreids: [], posterPath: "", vote_average: 10), isSelected: false, mediaRepository: MediaDetailsRepoImpl()))
}
