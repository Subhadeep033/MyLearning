//
//  ContentView.swift
//  DesignInSwiftUI
//
//  Created by DAPL-Asset-290 on 08/05/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 10.0){
                HStack(alignment: .top, spacing: 10.0){
                    Button(action: {
                        
                    }
                    ){
                        Text("Basic\n$9\nper month").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.white).multilineTextAlignment(.center)
                        
                    }.frame(width: (UIScreen.main.bounds.size.width - 32)/2, height: 200, alignment: .center).background(Color.purple).cornerRadius(25)
                    VStack(spacing: -15.0){
                        Button(action: {
                            
                        }
                        ){
                            Text("Pro\n$19\nper month").font(.largeTitle).fontWeight(.heavy).foregroundColor(Color.black).multilineTextAlignment(.center)
                            
                        }.frame(width: (UIScreen.main.bounds.size.width - 32)/2, height: 200, alignment: .center).background(Color(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0)).cornerRadius(25)
                        Text("Best for designer").font(.callout).fontWeight(.thin).foregroundColor(Color.black).multilineTextAlignment(.center).background(Color.yellow).frame(width: (UIScreen.main.bounds.size.width - 32)/2, height: 30, alignment: .center).cornerRadius(15)
                    }
                    
                }
                VStack(spacing: -15.0){
                    Button(action: {
                        
                    }
                    ){
                        VStack{
                            Image("magic").foregroundColor(.white).frame(width: 50.0, height: 50.0)
                            Text("Team\n$299\nper month").font(.title).fontWeight(.semibold).foregroundColor(Color.white).multilineTextAlignment(.center)
                        }
                        
                        
                    }.frame(width: (UIScreen.main.bounds.size.width - 32), height: 200, alignment: .center).background(Color(red: 55.0/255.0, green: 55.0/255.0, blue: 55.0/255.0)).cornerRadius(25)
                    Text("Perfect for teams with 20 team members").font(.callout).fontWeight(.thin).foregroundColor(Color.black).multilineTextAlignment(.center).background(Color.yellow).frame(width: UIScreen.main.bounds.size.width - 60, height: 30, alignment: .center).cornerRadius(15)
                }
                
                
                Spacer()
            }
            .padding().navigationBarTitle(Text("Subscription"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
