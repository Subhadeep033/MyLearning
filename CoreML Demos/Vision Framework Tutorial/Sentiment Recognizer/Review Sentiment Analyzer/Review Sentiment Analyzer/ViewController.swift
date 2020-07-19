//
//  ViewController.swift
//  Review Sentiment Analyzer
//
//  Created by DAPL-Asset-290 on 29/03/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import UIKit
import NaturalLanguage
class ViewController: UIViewController {

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var sentimentImageView: UIImageView!
    
    private lazy var sentimentClassifier : NLModel? = {
        let model = try? NLModel(mlModel: Review().model)
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clearButtonTap(_ sender: Any) {
        reviewTextView.text = ""
        clearButton.isEnabled = false
    }
    
}

extension ViewController : UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.text.isEmpty == false, text == "\n" {
            if let sentiment = sentimentClassifier?.predictedLabel(for: textView.text){
                switch sentiment {
                case "positive":
                    sentimentImageView.image = UIImage(named: "positive")
                case "negative":
                    sentimentImageView.image = UIImage(named: "negative")
                default:
                    sentimentImageView.image = UIImage(named: "neutral")
                }
            }
        }
        textView.resignFirstResponder()
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        clearButton.isEnabled = !textView.text.isEmpty
    }
}
