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
    // score label
    @IBOutlet weak var scoreUILabel: UILabel!
    
    // Question Text label
    @IBOutlet weak var questionUILabel: UILabel!
    
    // ProgressView
    @IBOutlet weak var progressUIProgressView: UIProgressView!
    
    // multiple choices UIButton
    @IBOutlet weak var choiceOneUIButton: UIButton!
    @IBOutlet weak var choiceTwoUIButton: UIButton!
    @IBOutlet weak var choiceThreeUIButton: UIButton!
    
    // object of type QuizzLogic structure
    var quizzLogic = QuizzLogic()
    
    // keep correct answer
    var score = 0

    // run only once app load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        // user's answer
        let userAnswer = sender.titleLabel?.text
        
        // check user's answer with correct answer
        if quizzLogic.checkAnswer(answer: userAnswer!){
            sender.tintColor = UIColor.green
            self.score += 1
            scoreUILabel.text = "score = \(self.score)"
        } else{
            sender.tintColor = UIColor.red
        }
        
        // update next question number
        quizzLogic.updateQuestionNumber()
        
        if quizzLogic.questionNumber == 0{
            self.score = 0
            scoreUILabel.text = "score = \(self.score)"
        }
        // timer to only show answer for 2 seconds
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    
    // reterives next question from array and update view
    @objc func updateUI(){
        // update question text
        questionUILabel.text = quizzLogic.getQuestionText()
        
        // update progress view
        progressUIProgressView.progress = quizzLogic.calculateProgressBar()
        
        // update multiplechoises
        choiceOneUIButton.setTitle(quizzLogic.getChoiceOne(), for: .normal)
        choiceTwoUIButton.setTitle(quizzLogic.getChoiceTwo(), for: .normal)
        choiceThreeUIButton.setTitle(quizzLogic.getChoiceThree(), for: .normal)
        
        // set tint color back to default
        choiceOneUIButton.tintColor = UIColor.black
        choiceTwoUIButton.tintColor = UIColor.black
        choiceThreeUIButton.tintColor = UIColor.black
        
        // when quizz finished, update view to start over
        if progressUIProgressView.progress == 1 {
            questionUILabel.text = quizzLogic.showResult(score: self.score)
            choiceOneUIButton.isHidden = true
            choiceTwoUIButton.isHidden = true
            scoreUILabel.isHidden = true
        } else{
            choiceOneUIButton.isHidden = false
            choiceTwoUIButton.isHidden = false
            scoreUILabel.isHidden = false

        }
        
       
    }
}

