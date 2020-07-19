//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    let diceImageArr = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Who          .What = Value
//        diceImageViewOne.image = #imageLiteral(resourceName: "DiceSix")
//        diceImageViewTwo.image = #imageLiteral(resourceName: "DiceTwo")
    }

    @IBAction func rollDiceButtonTap(_ sender: UIButton) {
        diceImageViewOne.image = diceImageArr[Int.random(in: 0...5)]
        diceImageViewTwo.image = diceImageArr[Int.random(in: 0...5)]
    }
    
}

