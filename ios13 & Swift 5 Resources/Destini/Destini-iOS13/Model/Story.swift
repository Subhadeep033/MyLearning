//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let storyText : String
    let option1 : String
    let next1 : Int
    let option2 : String
    let next2 : Int
    
    init(text: String, answer1 : String, nextOne : Int, answer2 : String, nextTwo : Int) {
        storyText = text
        option1 = answer1
        next1 = nextOne
        option2 = answer2
        next2 = nextTwo
    }
}
