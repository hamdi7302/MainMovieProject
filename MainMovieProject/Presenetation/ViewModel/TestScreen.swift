//
//  TestScreen.swift
//  MainMovieProject
//
//  Created by hamdi on 30/9/2024.
//

import SwiftUI

struct TestScreen: View {
    
    @State private var currentPage = 0
    @State private var selectedColor = Color.green
    var body: some View {
        
        ZStack {
            Color.black
            VStack{
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [selectedColor.opacity(0.5), Color.clear]),
                            center: .center,
                            startRadius: 5,
                            endRadius: 100
                        )
                    )
                    .frame(width: 200, height: 200)
                    .scaleEffect(x: 1.8)
                
                Spacer()
                
            }.offset(y: -80)
            
       
            
            VStack{
                
                VStack {
                        TabView(selection: $currentPage) {
                            FirstView(selectedColor: selectedColor).onAppear(perform: {
                                selectedColor = .green
                            })    .tag(0)
                            FirstView(selectedColor: selectedColor).onAppear(perform: {
                                selectedColor = .blue
                            })
                            .tag(1)
                            FirstView(selectedColor: selectedColor)
                                .onAppear(perform: {
                                    selectedColor = .pink
                                }).tag(2)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 10)
                     
                       
                }
               
             
                
                
                Button(action: {
                    // Action when button is tapped
                    print("Continue button tapped")
                }) {
                    VStack {
                        Text("Continue")
                            .font(.title2)
                            .foregroundColor(.white) // Use foregroundColor instead of foregroundStyle
                    }
                    .padding()
                    .frame(maxWidth: .infinity) // Make the VStack fill the available width
                    .background(Color.gray) // Set the background color
                    .cornerRadius(15) // Optional: Add corner radius for rounded corners
                }
                .padding()
                
                Spacer(minLength: 50)
            }
            
        }.ignoresSafeArea()
        
    }
}


struct FirstView: View{
    var selectedColor: Color
    var body: some View{
        
        VStack{
            Spacer(minLength: 100)
            Text("Ultradian rhythms are frequent biological cycles, like sleep stages or focus patterns.")
                .font(.title)
                .foregroundStyle(Color.white)
                .padding()
            Spacer()
            
            HStack(spacing: 0) {
                
                // Second Circle with rotation and mask
                Circle()
                    .stroke(selectedColor, lineWidth: 20)
                    .fill(Color.clear)
                    .frame(width: 200, height: 200)
                    .mask {
                        Rectangle()
                            .fill(Color.white) // Rectangle to mask the top part of the circle
                            .frame(width: 250, height: 120)
                            .offset(y: -50)
                    }
                    .rotationEffect(.degrees(180))
                
                Circle()
                    .stroke(Color.gray, lineWidth: 20)
                    .fill(Color.clear)
                    .frame(width: 200, height: 200)
                    .mask {
                        Rectangle()
                            .fill(Color.white) // Rectangle to mask the top part of the circle
                            .frame(width: 250, height: 120)
                            .offset(y: -50)
                    }
                
                // Rotate the second circle
            }.scaleEffect(x:1.1 , y: 0.8)
                .overlay {
                    ZStack {
                        Color.clear.edgesIgnoringSafeArea(.all)
                        
                        Circle()
                            .fill(selectedColor.opacity(0.5))
                            .frame(width: 100, height: 100)
                            .blur(radius: 20)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 45, height: 45)
                    }
                }
            Spacer(minLength: 120)
        }
    }
}


#Preview {
    TestScreen()
}
