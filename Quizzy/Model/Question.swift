//
//  Question.swift
//  Quizzy
//
//  Created by Negin Zahedi on 2022-06-17.
//
// Model: Logic and Data
//

import Foundation

struct Question{
    
    let text: String
    let choiceOne: String
    let choiceTwo: String
    let choiceThree: String
    let answer: String
    
    
    init(text: String, choiceOne: String, choiceTwo: String, choiceThree: String, answer: String){
        self.text = text
        self.choiceOne = choiceOne
        self.choiceTwo = choiceTwo
        self.choiceThree = choiceThree
        self.answer = answer
    }
}
