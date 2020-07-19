//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStory()
    }
    
    
    @IBAction func selectChoiceTap(_ sender: UIButton) {
        storyBrain.setNextStory(sender.tag)
        changeStory()
    }
    

    private func changeStory(){
        storyLabel.text = storyBrain.getStory()
      choice1Button.setTitle(storyBrain.setOption().0, for: .normal)
        choice2Button.setTitle(storyBrain.setOption().1, for: .normal)
    }
}

