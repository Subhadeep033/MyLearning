//
//  DetailView.swift
//  TechNews
//
//  Created by DAPL-Asset-290 on 29/06/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI
import WebKit
struct DetailView: View {
    
    let url : String?
    
    var body: some View {
        WebView(urlStr: url).hideNavigationBar()
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

struct WebView : UIViewRepresentable {
    
    let urlStr : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlStr{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
                
            }
        }
    }
}


extension View {
    func hideNavigationBar() -> some View {
        self
            .navigationBarTitle("Details", displayMode: .inline)
            //.navigationBarHidden(true)
    }
    
    func changeNavigationTintColor() {
        UINavigationBar.appearance().tintColor = .white
    }
}
