//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeQuestion()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.changeQuestionNumber()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.changeQuestion()
        }
    }
    
    private func changeQuestion(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Scores : \(quizBrain.getScore())"
        optionOneButton.setTitle(quizBrain.setAnswer()[0], for: .normal)
        optionTwoButton.setTitle(quizBrain.setAnswer()[1], for: .normal)
        optionThreeButton.setTitle(quizBrain.setAnswer()[2], for: .normal)
        optionOneButton.backgroundColor = UIColor.clear
        optionTwoButton.backgroundColor = UIColor.clear
        optionThreeButton.backgroundColor = UIColor.clear
        
    }
    
}

