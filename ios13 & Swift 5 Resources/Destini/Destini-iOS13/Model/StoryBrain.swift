//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let storyContent = [
        Story(
        text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
        answer1: "I'll hop in. Thanks for the help!", nextOne: 2,
        answer2: "Better ask him if he's a murderer first.", nextTwo: 1
    ),
    Story(
        text: "He nods slowly, unfazed by the question.",
        answer1: "At least he's honest. I'll climb in.", nextOne: 2,
        answer2: "Wait, I know how to change a tire.", nextTwo: 3
    ),
    Story(
        text: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
        answer1: "I love Elton John! Hand him the cassette tape.", nextOne: 5,
        answer2: "It's him or me! You take the knife and stab him.", nextTwo: 4
    ),
    Story(
        text: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
        answer1: "The", nextOne: 0,
        answer2: "End", nextTwo: 0
    ),
    Story(
        text: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
        answer1: "The", nextOne: 0,
        answer2: "End", nextTwo: 0
    ),
    Story(
        text: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
        answer1: "The", nextOne: 0,
        answer2: "End", nextTwo: 0
    )
]
    
    var storyNumber = 0
    
    func getStory() -> String{
        return storyContent[storyNumber].storyText
    }
    
    mutating func setNextStory(_ withOption: Int){
        if withOption == 0{
            storyNumber = storyContent[storyNumber].next1
        }
        else{
            storyNumber = storyContent[storyNumber].next2
        }
    }
    
    func setOption() -> (String,String){
        let ans1 = storyContent[storyNumber].option1
        let ans2 = storyContent[storyNumber].option2
        return (ans1,ans2)
    }
}
