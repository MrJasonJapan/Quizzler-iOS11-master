//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer(questionNumber: questionNumber)
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
        if questionNumber < allQuestions.list.count {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else {
            
            // add an alert and alertAction programmatically.
            let alert = UIAlertController(title: "You've answered all the questions.", message: "Start over?", preferredStyle: .alert)
    
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer(questionNumber index: Int) {
    
        let correctAnswer = allQuestions.list[index].answer
        
        if pickedAnswer == correctAnswer {
            print("You got it.")
        }
        else {
            print("Wrong.")
        }
    }
    
    
    func startOver() {
        questionNumber = 0 // reset questionNumber
        nextQuestion()
    }
    

    
}
