//
//  TutorDetails.swift
//  LearningSwiftUI
//
//  Created by DAPL-Asset-290 on 08/05/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI

struct TutorDetails: View {
    
    var name: String
    var headline: String
    var bio: String
    
    var body: some View {
        VStack {
            Image(name)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.orange, lineWidth: 4)
                )
                .shadow(radius: 10)
            Text(name)
                .font(.title)
            Text(headline)
                .font(.subheadline)
            Divider()
            Text(bio)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(50)
            }.padding().navigationBarTitle(Text(name), displayMode: .inline)
    }
}

#if DEBUG
struct TutorDetails_Previews: PreviewProvider {
    static var previews: some View {
        TutorDetails(name: "Sai Kambampati", headline: "Writer at AppCoda", bio: "Sai Kambampati is an app developer. He lives in Sacramento, CA and was awarded with Apple's WWDC 2017 Scholarship. Proficient in Swift and Python, it's his dream to develop an AI product.")
    }
}
#endif

