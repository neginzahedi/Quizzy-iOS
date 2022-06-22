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
        Question(text: "What is the capital of Canada?", choiceOne: "Montreal",choiceTwo: "Ottawa",choiceThree: "Toronto", answer: "Ottawa") ]
    
    var questionNumber = 0
    
    // keeps score of true answers
    var score = 0
    
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
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        } else{
            
            questionNumber = 0
        }
    }
    
    //    mutating func updateScore() -> Int{
    //        self.score += 1
    //        return score
    //    }
    
    // return text of next question
    func getQuestionText() -> String{
        return quiz[questionNumber].text
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
    
    // calculate and return progressbar percentage
    func calculateProgressBar() -> Float{
        return Float(questionNumber+1)/Float(quiz.count)
    }
    
    func showResult(score: Int)->String{
        return "your score is \(score)"
    }
}
