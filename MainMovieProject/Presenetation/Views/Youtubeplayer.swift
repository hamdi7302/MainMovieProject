//
//  Youtubeplayer.swift
//  MainMovieProject
//
//  Created by hamdi on 6/10/2024.
//

import Foundation
import SwiftUI
import WebKit

struct YouTubePlayer: UIViewRepresentable {
    var videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let youtubeURL = "https://www.youtube.com/embed/\(videoID)"
        let request = URLRequest(url: URL(string: youtubeURL)!)
        uiView.load(request)
    }
}

