//
//  RatingAverage.swift
//  MainMovieProject
//
//  Created by hamdi on 11/10/2024.
//

import SwiftUI

struct RatingAverage: View {
    @ObservedObject var viewModel: MediaCardViewModel
    var body: some View {
      
            if viewModel.showActions && viewModel.showVideo == false {
                Circle()
                    .trim(from: 0.0, to: viewModel.card.vote_average / 10)
                    .stroke(lineWidth: 3)
                    .frame(width: 38, height: 38, alignment: .center)
                    .rotationEffect(Angle(degrees: -90))
                    .foregroundStyle(viewModel.getRate().1)
                    .background{
                        Circle()
                        
                            .stroke(lineWidth: 4)
                            .frame(width: 38, height: 38, alignment: .center)
                            .foregroundStyle(viewModel.getRate().1.opacity(0.4))
                    }
                    .background(Circle().foregroundStyle(Color.black).frame(width: 50, height: 50, alignment: .center))
                  
                    
                    
                    .overlay {
                        HStack(spacing:0){
                            Text("\(Int(viewModel.card.vote_average * 10))")
                                
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                               
                            Text("%")
                               
                                .font(.system(size: 7))
                                .textScale(.secondary)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.bottom)
                                .foregroundStyle(viewModel.getRate().1)
                            
                        }.offset(x:2)
                            
                    }
            }
    }
}

//#Preview {
//    RatingAverage()
//}
