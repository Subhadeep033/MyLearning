//
//  ContentView.swift
//  AnimationWithSwiftUI
//
//  Created by DAPL-Asset-290 on 21/05/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   // @State private var animationAmount : CGFloat = 1
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
//MARK: 1st Animation Example ----
//        Button("Tap Me"){
//            //self.animationAmount += 1
//        }.padding(20)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle().stroke(Color.red).scaleEffect(animationAmount).opacity(Double(2 - animationAmount)).animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
//        ).onAppear{
//            self.animationAmount = 2
//        }
        
//MARK: 2nd Animation Example ---
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing).frame(width:300, height: 200).clipShape(RoundedRectangle(cornerRadius: 20)).offset(dragAmount).gesture(
//            DragGesture().onChanged{ self.dragAmount = $0.translation }.onEnded{_ in
//                withAnimation(.spring()){
//                    self.dragAmount = .zero
//                }
//            }
//        )
        
//MARK: 3rd Animation Example ---
        HStack(spacing : 0){
            ForEach(0..<letters.count){ num in
                Text(String(self.letters[num])).padding(5).font(.title).background(self.enabled ? Color.blue : Color.red).offset(self.dragAmount).animation(Animation.default.delay(Double(num) / 20))
            }
        }.gesture(
            DragGesture().onChanged{ self.dragAmount = $0.translation
            }.onEnded{_ in
                self.dragAmount = .zero
                self.enabled.toggle()
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
