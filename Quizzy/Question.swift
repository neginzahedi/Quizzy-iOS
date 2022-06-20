//
//  Question.swift
//  Quizzy
//
//  Created by Negin Zahedi on 2022-06-17.
//

import Foundation

struct Question{
    
    let text: String
    let answer: String
    
    
    init(text: String, answer: String){
        self.text = text
        self.answer = answer
    }
}
