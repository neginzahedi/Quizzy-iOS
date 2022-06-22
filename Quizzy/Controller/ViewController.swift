//
//  ViewController.swift
//  Quizzy
//
//  Created by Negin Zahedi on 2022-06-14.
//
// Controller: Mediator (gives logic and data from Model and displays on View)
//

import UIKit

class ViewController: UIViewController {
    // score UILabel
    @IBOutlet weak var scoreUILabel: UILabel!
    
    // Question Text UILable
    @IBOutlet weak var questionUILabel: UILabel!
    
    //ProgressView
    @IBOutlet weak var progressUIProgressView: UIProgressView!
    
    // multiple choices UIButton
    @IBOutlet weak var choiceOneUIButton: UIButton!
    @IBOutlet weak var choiceTwoUIButton: UIButton!
    @IBOutlet weak var choiceThreeUIButton: UIButton!
    
    // object of type QuizzLogic structure
    var quizzLogic = QuizzLogic()
    
    var score = 0
    
    // run only once app load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        // user's answer
        let userAnswer = sender.titleLabel?.text
        // correct answer
        if quizzLogic.checkAnswer(answer: userAnswer!){
            sender.tintColor = UIColor.green
            score += 1
            scoreUILabel.text = "score = \(score)"
        } else{
            sender.tintColor = UIColor.red
        }
        
        quizzLogic.updateQuestionNumber()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    
    }
    
    
    
    // reterives next question from array
    @objc func updateQuestion(){
        questionUILabel.text = quizzLogic.getQuestionText()
        progressUIProgressView.progress = quizzLogic.calculateProgressBar()
        
        choiceOneUIButton.setTitle(quizzLogic.getChoiceOne(), for: .normal)
        choiceTwoUIButton.setTitle(quizzLogic.getChoiceTwo(), for: .normal)
        choiceThreeUIButton.setTitle(quizzLogic.getChoiceThree(), for: .normal)
        
        choiceOneUIButton.tintColor = UIColor.black
        choiceTwoUIButton.tintColor = UIColor.black
        choiceThreeUIButton.tintColor = UIColor.black
        
        if progressUIProgressView.progress == 1{
            questionUILabel.text = quizzLogic.showResult(score: score)
            choiceOneUIButton.isHidden = true
            choiceTwoUIButton.isHidden = true
            choiceThreeUIButton.setTitle("start over", for: .normal)
        } else{
            choiceOneUIButton.isHidden = false
            choiceTwoUIButton.isHidden = false
        }
    }
}

