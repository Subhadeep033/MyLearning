//
//  ContentView.swift
//  Card
//
//  Created by DAPL-Asset-290 on 29/06/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52, opacity: 1.00).edgesIgnoringSafeArea(.all)
            Text("Subhadeep Chakraborty")
                .font(Font.custom("MuseoModerno-ExtraBold", size: 35))
                .foregroundColor(.white)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
