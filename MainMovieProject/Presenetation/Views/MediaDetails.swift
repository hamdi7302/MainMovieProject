//
//  MediaDetails.swift
//  MainMovieProject
//
//  Created by hamdi on 11/10/2024.
//

import SwiftUI

struct MediaDetails: View {
    @ObservedObject var  viewModel : MediaCardViewModel
    var body: some View{
        VStack{
            Rectangle()
                .frame(height: 250, alignment: .center)
                .foregroundColor(.cyan)
            ScrollView(showsIndicators: false){
              
                VStack{
                    Text(viewModel.card.overview)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .lineLimit(/*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .padding()
                    BuyOrRent()
                    PeopleCast()
                    SimilarMovies(viewModel: viewModel)
                      
                }.background(Color.gray)
                    .cornerRadius(12)
                    .padding(.horizontal,40)
            }
        }
        .ignoresSafeArea()
        .foregroundColor(.white)
        .background(Color.black)
    }
}

struct BuyOrRent: View {
  
    var body: some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20){
                    ForEach(1..<7) { index in
                        Image(systemName: "cube.transparent.fill")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .center)
                    }
                }
            }.padding()
        }.background(Color.orange)
          .cornerRadius(12)
        .padding()
        
    }
}
 
struct PeopleCast: View {
  
    var body: some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20){
                    ForEach(1..<7) { index in
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .center)
                    }
                }
            }.padding()
        }.background(Color.cyan)
          .cornerRadius(12)
        .padding()
        
    }
}

struct SimilarMovies: View {
    @ObservedObject var  viewModel : MediaCardViewModel
    var body: some View {
        VStack{
           
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 20){
                    ForEach(1..<7) { index in
                        Image(systemName: "questionmark.folder.fill")
                            .resizable()
                            .frame(width: 150, height: 75, alignment: .center)
                    }
                }
            }.padding()
        }.background(Color.yellow)
          .cornerRadius(12)
        .padding()
        
    }
}



#Preview {
    MediaDetails(viewModel: MediaCardViewModel(index: 1, resultCard: Movie(id: 12, originalTitle: "Sample Movie", overview: "A thrilling journey of adventure and discovery.A thrilling journey of adventure and discoveryA thrilling journey of adventure and discoveryA thrilling journey of adventure and discovery", popularity: 8.5, realeaseDate: "2024-10-07", mediaType: MediaType.movie.rawValue, genreids: [], posterPath: "", vote_average: 10), isSelected: false, mediaRepository: MediaDetailsRepoImpl()))
}
