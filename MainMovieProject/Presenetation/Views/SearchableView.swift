//
//  SearchableView.swift
//  MainMovieProject
//
//  Created by hamdi on 10/10/2024.
//

import SwiftUI

struct SearchableView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var searchableText = ""

    var body: some View {
        VStack {
            Text("Result of the search: \(searchableText)")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search...", text: $searchableText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Spacer()
                        }
                        .padding()
                    }
                }
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "xmark").onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}


#Preview {
    SearchableView()
}
