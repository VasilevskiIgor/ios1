//
//  ViewController.swift
//  quizeApp
//
//  Created by Igor on 1/4/17.
//  Copyright © 2017 Igor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let questions = ["Favorite pet?", "Favorite color?", "where was I born?"]
    let answers = [["dog", "cat", "bird"], ["blue", "black", "green"], ["Tokyo", "New York", "Tennesse"]]
    
    //variables 
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    
    
    //label
    
    @IBOutlet weak var lbl: UILabel!
   
    
    //Button
    
    @IBAction func action(_ sender: AnyObject) {
        if (sender.tag == Int(rightAnswerPlacement))
        {
        print ("Right!!!")
            points += 1
        }
        else
        {
        print ("Wrong!!!!")
        }
        if (currentQuestion != questions.count)
        {
        newQuestion()
        }
        else{
        performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
//function that displays new question
    func newQuestion(){
        lbl.text = questions[currentQuestion]
        
        rightAnswerPlacement = arc4random_uniform(3)+1
        //create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3
        {
        //Create a button 
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
        }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
         
    }
          currentQuestion += 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

