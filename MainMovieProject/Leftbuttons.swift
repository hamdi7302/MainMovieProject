//
//  Leftbuttons.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct Leftbuttons: View {
    var body: some View {
        VStack {
            VStack(spacing: 15 ) {
                
                Button {
                    
                } label: {
                    Image(systemName: "info.circle.fill")
                        .mask {
                            Circle().fill(Color.white)
                        }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "play.fill")
                        .foregroundStyle(Color.orange)
                    
                }
                Button {
                    
                } label: {
                    Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                        .foregroundStyle(Color.green)
                    
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(Color.pink)
                    
                }
                Button {
                    
                } label: {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.yellow)
                }
                Button {
                    
                } label: {
                    Image(systemName: "bookmark.fill")
                        .foregroundStyle(Color.teal)
                    
                }
            }
        }
    }
}

#Preview {
    Leftbuttons()
}
