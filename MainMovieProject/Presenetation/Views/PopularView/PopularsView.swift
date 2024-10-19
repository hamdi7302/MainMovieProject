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
                        MediaImage(viewModel: vm)
                            .frame(width: 200,height: 200)
                            .offset(offset)
                            .onAppear(perform: {
                                print(index)
                                DispatchQueue.main.async {
                                    vm.executeFetchImage()
                                }
                                
                            }).gesture(
                                DragGesture()
                                    .onChanged { value in
                                        offset = value.translation // Update the offset during dragging
                                    }
                                    .onEnded { value in
                                        // Reset offset if dragging is released
                                        withAnimation {
                                            DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {
                                                offset = .zero
                                                viewModel.mediaCardViewModels.removeFirst()
                                            })
                                            
                                        }
                                    }
                            )
                    }else{
                        
                        MediaImage(viewModel: vm)
                            .frame(width: 200,height: 200)
                            .onAppear(perform: {
                                print(index)
                                DispatchQueue.main.async {
                                    vm.executeFetchImage()
                                }
                                
                            })
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
