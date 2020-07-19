//
//  ContentView.swift
//  TechNews
//
//  Created by DAPL-Asset-290 on 29/06/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI

struct InitialView: View {
    @ObservedObject var networkManager = NetWorkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                createList(post: post)
            }.padding(.bottom, 1.0).navigationBarTitle(Text("Tech News")).onAppear{
                UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
                UITableView.appearance().showsHorizontalScrollIndicator = false
                //UIScrollView.appearance().bounces = false
            }
        }
        .onAppear{
            self.networkManager.fetchNews()
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

struct createList : View {
    let post : Post
    
    var body : some View{
        return NavigationLink(destination: DetailView(url: post.url)) {
            HStack(spacing: 20){
                VStack(spacing: 12){
                    Image(systemName: "star.fill").foregroundColor(.green)
                    Text("\(post.points)")
                }
                VStack(alignment:.leading, spacing: 5) {
                    Text(post.title ).font(.system(size: 20))
                    HStack(spacing: 5){
                        Text("Author:")
                        Text((post.author ?? "").uppercased()).fontWeight(.semibold)
                    }
                }
            }
        }
        
    }
}
