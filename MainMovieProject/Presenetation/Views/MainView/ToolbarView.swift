//
//  ToolbarView.swift
//  MainMovieProject
//
//  Created by hamdi on 10/10/2024.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").padding(.leading,20)
            NavigationLink(destination: SearchableView()) {
                Text("Search in")
                    .foregroundColor(.primary)
            }.padding(.trailing,20)
        } .background(
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 40)
                .cornerRadius(8)
        )
    }
}
#Preview {
    ToolbarView()
}
