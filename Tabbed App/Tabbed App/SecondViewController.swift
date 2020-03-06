//
//  SecondViewController.swift
//  Tabbed App
//
//  Created by Apple on 2/21/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Scorebox: UITextField!
    
    @IBOutlet weak var TrueButton: UIButton!
    
    @IBOutlet weak var FalseButton: UIButton!
    
    @IBOutlet weak var TextField: UITextField!
    
    let Q = TopLevelStorage()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.text = (Q.allQs[0].statement)
    }
    
    
    @IBAction func selectTrue(_ sender: Any) {
         let d = Q.currQuestion()
         
         if (Q.allQs[(d)].isTrue == true){
             Q.correctAnswer()
         } else {
             Q.inCorrectAnswer()
         }
         let c = Q.totAns()
         let n = Q.nextQuestionNumber()
         TextField.text = Q.allQs[(n)].statement;
         Scorebox.text =  "\(c)"
    }
    
    @IBAction func selectFalse(_ sender: Any) {
        let d = Q.currQuestion()
        
        if (Q.allQs[(d)].isTrue == false){
            Q.correctAnswer()
        } else {
            Q.inCorrectAnswer()
        }
        let c = Q.totAns()
        let n = Q.nextQuestionNumber()
        TextField.text = Q.allQs[(n)].statement;
        Scorebox.text = "\(c)"
    }
    @IBAction func questionBox(_ sender: Any) {
    }
}

