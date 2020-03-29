//
//  ViewController.swift
//  Project2
//
//  Created by HaroldDavidson on 3/28/20.
//  Copyright © 2020 HaroldDavidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCount = 1
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        questionCount += 1
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Your score is \(score)"
        } else {
            title = "Wrong."
            score -= 1
            message = "The answer was \(correctAnswer + 1). Your score is \(score)"
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        if questionCount == 10 {
            title = "10/10 answered. Score: \(score)"
        } else {
            title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        }
    }

}

