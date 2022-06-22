//
//  QuizzLogic.swift
//  Quizzy
//
//  Created by Negin Zahedi on 2022-06-21.
//
// Model: Logic and Data
//

import Foundation

struct QuizzLogic{
    
    // Array of Questions' Text, three multiple choices and one true answer
    let quiz = [
        Question(text: "What is the capital of Canada?", choiceOne: "Montreal",choiceTwo: "Ottawa",choiceThree: "Toronto", answer: "Ottawa"),
        Question(text: "Which Canadian province has the highest population?", choiceOne: "British Colombia",choiceTwo: "Manitoba",choiceThree: "Ontario", answer: "Ontario"),
        Question(text: "What is the national animal of Canada?", choiceOne: "Beaver",choiceTwo: "Moose",choiceThree: "Grizzly Bear", answer: "Beaver"),
        Question(text: "What is the capital of Manitoba?", choiceOne: "Edmonton",choiceTwo: "Regina",choiceThree: "Winnipeg", answer: "Winnipeg"),
        Question(text: "What British sea captain charted the coast of British Columbia in the 1790s?", choiceOne: "Sir Francis Drake",choiceTwo: "Henry Hudson",choiceThree: "George Vancouver", answer: "George Vancouver"),
        Question(text: "What province did not join Canada until 1949?", choiceOne: "British Colombia",choiceTwo: "Newfoundland and Labrador",choiceThree: "Quebec", answer: "Newfoundland and Labrador"),
        Question(text: "What country kicked out Canada's ambassador after the Canadian government called for the release of two dissidents in 2018?", choiceOne: "China",choiceTwo: "Peru",choiceThree: "Saudi Arabia", answer: "Saudi Arabia"),
        Question(text: "About what percent of Canadians speak French as a first language?", choiceOne: "9",choiceTwo: "22",choiceThree: "49", answer: "22"),
        Question(text: "About what percent of Canadian residents were born in a different country?", choiceOne: "3",choiceTwo: "11",choiceThree: "22", answer: "22"),
        Question(text: "What is depicted on the front of a Canadian $1 coin?", choiceOne: "a City",choiceTwo: "a Loon",choiceThree: "a Maple Leaf", answer: "a Loon"),
        Question(text: "result", choiceOne: "hide",choiceTwo: "hide",choiceThree: "startover", answer: "hide"),
    ]
    
    var questionNumber = 0
    
    // return text of next question
    func getQuestionText() -> String{
        return quiz[self.questionNumber].text
    }
    
    // calculate and return progressbar percentage
    func calculateProgressBar() -> Float{
        return Float(self.questionNumber+1)/Float(quiz.count)
    }
    
    
    // check user's answer and return true or false
    func checkAnswer(answer userAnswer:String) -> Bool{
        // if user's answer is correct
        if userAnswer == quiz[questionNumber].answer{
            return true
        }else{
            return false
        }
    }
    
    // update question number to go next question
    mutating func updateQuestionNumber(){
        if self.questionNumber + 1 < quiz.count{
            self.questionNumber += 1
        } else{

            self.questionNumber = 0
        }
    }
    
    func getChoiceOne() -> String{
        return quiz[questionNumber].choiceOne
    }
    
    func getChoiceTwo() -> String{
        return quiz[questionNumber].choiceTwo
    }
    func getChoiceThree() -> String{
        return quiz[questionNumber].choiceThree
    }
    
    
    func showResult(score: Int)->String{
        if 0...5 ~= score {
            return "You should try hard... You scored \(score)/10"
        } else{
        return "Well Done! You scored \(score)/10!"
        }
    }
    
}
