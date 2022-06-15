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
    
    // only once load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func answerSelected(_ sender: UIButton) {
    }
    
    

}

