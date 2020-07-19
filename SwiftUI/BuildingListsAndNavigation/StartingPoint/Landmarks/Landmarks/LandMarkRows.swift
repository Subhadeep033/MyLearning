//
//  LandMarkRows.swift
//  Landmarks
//
//  Created by DAPL-Asset-290 on 01/07/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandMarkRows: View {
    //@EnvironmentObject var userData: UserData
    var landmark: Landmark

    
    
    var body: some View {
        HStack{
            landmark.image.resizable().frame(width: 50, height: 50)
            Text(landmark.name).font(.title)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }.padding()
    }
}

struct LandMarkRows_Previews: PreviewProvider {
    static var previews: some View {
        LandMarkRows(landmark: landmarkData[0])
    }
}
