//
//  ViewController.swift
//  Quizzy
//
//  Created by Negin Zahedi on 2022-06-14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreUILabel: UILabel!
    @IBOutlet weak var questionUILabel: UILabel!
    @IBOutlet weak var progressUIProgressView: UIProgressView!
    @IBOutlet weak var trueUIButton: UIButton!
    @IBOutlet weak var falseUIButton: UIButton!
    
    let quiz = [
        Question(text: "Canada is bordered by three different oceans.", answer: "True"),
        Question(text: "Ottawa is the capital city of Canada", answer: "True"),
        Question(text: "Ontario is a city in Alberta.", answer: "False"),
        Question(text: "There are three territories in Northern Canada", answer: "True"),
        Question(text: "British Columbia is the westernmost province.", answer: "True"),
        Question(text: "Canada is the largest country by landmass", answer: "False"),
        Question(text: "Nova Scotia is in the interior of Canada.", answer: "False"),
        Question(text: "Mount Logan is the tallest mountain in Canada.", answer: "True"),
        Question(text: "Manitoba is a city in Winnipeg.", answer: "False"),
        Question(text: "The capital of Alberta is Calgary.", answer: "False"),
    ]
    
    var questionNumber = 0
        
    // only once load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuestion()
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        // user's answer
        let userAnswer = sender.titleLabel?.text
        // correct answer
        let rightAnswer = quiz[questionNumber].answer
        
        // if user's answer is correct set color of answer to greem if not red
        if userAnswer == rightAnswer{
            sender.tintColor = UIColor.green
        }else{
            sender.tintColor = UIColor.red
        }
        
       
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        } else{
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        
      
    }
    
    
    
    // reterives next question from array
    @objc func updateQuestion(){
        questionUILabel.text = quiz[questionNumber].text
        trueUIButton.tintColor = UIColor.black
        falseUIButton.tintColor = UIColor.black
    }
}

