//
//  ContentView.swift
//  LearningSwiftUI
//
//  Created by DAPL-Asset-290 on 08/05/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
        UINavigationBar.appearance().tintColor = .black
        
    }
    
    var tutors: [Tutor] = testData
    
    var body: some View {
        NavigationView {
            List(tutors) { tutorr in
                TutorCell(tutor: tutorr)
            }.padding(.bottom, 1.0).navigationBarTitle(Text("Family List")).onAppear {
                UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
                UITableView.appearance().tableFooterView = UIView()
                //UITableView.appearance().bounces = false
                UITableView.appearance().showsVerticalScrollIndicator = false
                UITableView.appearance().showsHorizontalScrollIndicator = false
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


struct Tutor: Identifiable {
    var id = UUID()
    var name: String
    var headline: String
    var bio: String
    
    var imageName: String { return name }
}

let testData = [
    Tutor(name: "Sai Kambampati", headline: "Writer at AppCoda", bio: "Sai Kambampati is an app developer. He lives in Sacramento, CA and was awarded with Apple's WWDC 2017 Scholarship. Proficient in Swift and Python, it's his dream to develop an AI product."),
    Tutor(name: "Simon Ng", headline: "Founder of AppCoda", bio: "Founder of AppCoda. Author of multiple iOS prgramming books including Beginning iOS 12 Programming with Swift and Intermediate iOS 12 Programming with Swift. iOS Developer and Blogger."),
    Tutor(name: "Gabriel Theodoropoulos", headline: "Advanced Software Developer", bio: "Gabriel has been a software developer for about two decades. He has long experience in developing software solutions for various platforms in many programming languages."),
    Tutor(name: "Andrew Jaffee", headline: "Author and Software Developer", bio: "Avid and well-published author and software developer now specializing in iOS mobile app development in Obj-C and Swift. Andrew has published several apps in the Apple App Store and 30 years of experience."),
    Tutor(name: "Athena Lam", headline: "Content marketing professional", bio: "Athena is a co-founder of Business 3.0, a publication dedicated to sharing founders journeys in product and business development in East Asia. Social justice advocate."),
    Tutor(name: "Alfian Losari", headline: "Lifelong Learner", bio: "Mobile, Web, a bit of backend Software Developer and LifeLong Learner. Current building super app."),
    Tutor(name: "Lawrence Tan", headline: "Passionate iOS Developer", bio: "Lawrence is a passionate iOS Developer with over 3 years of commercial experience and had worked with clirents from US, Europe, and Asia. He's a tech addict and Swift enthusiast."),
    Tutor(name: "Kelvin Tan", headline: "Self-taught iOS Mobile Developer", bio: "Kelvin is a self taught iOS Mobile Developer who is currently active writing tutorials on his site. He is from Malaysia and speaks about 4 different languages."),
]


struct TutorCell : View {
    let tutor: Tutor
    var body: some View {
        return NavigationLink(destination: TutorDetails(name: tutor.name, headline: tutor.headline, bio: tutor.bio)) {
            Image(tutor.imageName)
                .cornerRadius(40)
            VStack(alignment: .leading, spacing: 3.0) {
                Text(tutor.name).fontWeight(.bold)
                Text(tutor.headline)
                    .font(.subheadline).fontWeight(.medium)
                    .foregroundColor(.gray)
            }
        }
    }
}
