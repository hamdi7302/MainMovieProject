//
//  PopularView.swift
//  MainMovieProject
//
//  Created by hamdi on 18/10/2024.
//

//TODO: -  Disover :  draggable protocol

import SwiftUI

struct PopularMoviesView: View {
    //  for testing purpose i will use the same view odel used in trending
    @ObservedObject var viewModel : TrendingMoviesViewModel
    @State var offset : CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            
            ZStack { // Add spacing between rectangles
                 
                ForEach(viewModel.mediaCardViewModels.prefix(3).reversed(), id:  \.card.id) {vm in
                    
                    if viewModel.mediaCardViewModels.first?.card.id == vm.card.id {
                        VStack{
                            Text(vm.card.originalTitle)
                                .font(.title)
                                .foregroundStyle(.white)
                            Spacer()
                            MediaImage(viewModel: vm)
                                .frame(width: 300,height: 500)
                                .offset(offset)
                                .onAppear(perform: {
                                    offset = .zero
                                    DispatchQueue.main.async {
                                        vm.executeFetchImage()
                                    }
                                    
                                }).gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            offset = value.translation
                                        }
                                        .onEnded { value in
                                            
                                            withAnimation {
                                                DispatchQueue.main.asyncAfter(deadline: .now()+0.01, execute: {
                                                    if value.startLocation.distance(to: value.location) > 100 {
                                                        viewModel.mediaCardViewModels.removeFirst()
                                                    }else {
                                                        offset = .zero
                                                    }
                                                })
                                                
                                            }
                                        }
                                )
                        }.padding(50)
                    }else{
                        VStack{
                            Spacer()
                            MediaImage(viewModel: vm)
                                .blur(radius: 3)
                                .rotationEffect(Angle(degrees: 10))
                                .frame(width: 300,height: 500)
                                .onAppear(perform: {
                                    DispatchQueue.main.async {
                                        vm.executeFetchImage()
                                    }
                                    
                                })
                        }.padding(50)
                            .allowsHitTesting(false)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}





#Preview {
    PopularMoviesView(viewModel:DIContainer().makeTrendingViewModel())
}
