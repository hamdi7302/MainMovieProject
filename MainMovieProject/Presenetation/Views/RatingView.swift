//
//  RatingView.swift
//  MainMovieProject
//
//  Created by hamdi on 4/10/2024.
//

import SwiftUI

struct RatingView: View {
    
    @State var rating: Int =  3
    
    private var starsView: some View {
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut, {
                            rating = index
                        })
                    }
            }
        }
    }
    
    private var starViewMask : some View {
        GeometryReader(content: { geometry in
            Rectangle()
                .fill(Color.yellow)
                .frame(width: geometry.size.width / 5 * CGFloat(rating))
                .mask(alignment: .leading) {
                    starsView
                }
        }).allowsHitTesting(false)
    }
    
    var body: some View {
        starsView.overlay {
            starViewMask
        }.padding()
        .background(Color.white)
    }
}


#Preview {
    ZStack{
        Color.cyan.ignoresSafeArea()
        RatingView()
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
    }
}
