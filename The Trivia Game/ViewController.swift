//
//  ViewController.swift
//  The Trivia Game
//
//  Created by Bruno Soares da Silva on 3/14/16.
//  Copyright © 2016 Bruno Soares da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var amazing: UILabel!
    @IBOutlet weak var trivia: UILabel!
    @IBOutlet weak var start_btn: UIButton!
    @IBOutlet weak var option1_btn: UIButton!
    @IBOutlet weak var option2_btn: UIButton!
    @IBOutlet weak var option3_btn: UIButton!
    @IBOutlet weak var option4_btn: UIButton!
    @IBOutlet weak var score_lb: UILabel!
    @IBOutlet weak var questionnumber_lb: UILabel!
    @IBOutlet weak var questionarea_lb: UILabel!
    @IBOutlet weak var answerarea_fd: UITextField!
    @IBOutlet weak var tiparea_lb: UILabel!
    @IBOutlet weak var tiptoggle_lb: UILabel!
    @IBOutlet weak var tip_tg: UISwitch!

    
    var idx = 0
    var score_var = 0
    var question_count = 2
    var showingTip = false
    
    let questions = ["(CH3)2C(C6H4OH)2 é o nome do?", "Quantos litros de aguá são necessários para um adulto viver normalmente?"]
    let tips = ["Presentes em materiais plásticos", "E mais de 1 litro"]
    let answers = ["BISPHENOL A", "2"]
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames()
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNamesForFamilyName(familyName)
            print("Font Names = [\(names)]")
        }
    }
    
    @IBAction func losePoints(sender: AnyObject){
        score_var -= 10
        score_lb?.text = String(score_var)
    }
    
    @IBAction func getPoints(sender: AnyObject){
        score_var += 10
        score_lb?.text = String(score_var)
    }
    
    func fillScreen(){
        questionnumber_lb?.text = String(question_count)
        questionarea_lb?.text = questions[idx]
        if(showingTip){
            showHideTip(0)
            tip_tg.setOn(false, animated: true)
            
        }
    }
    
    @IBAction func nextQuestion(sender: AnyObject){
        idx = min(idx+1, questions.count-1)
        fillScreen()
    }
    
    @IBAction func previousQuestion(sender: AnyObject){
        idx = max(idx-1, 0)
        fillScreen()
    }
    
    @IBAction func showHideTip(sender: AnyObject) {
        showingTip = !showingTip
        if(showingTip){
            tiparea_lb.text = tips[idx]
            tiptoggle_lb.text = "Hide Tip"
        }else{
            tiparea_lb.text = ""
            tiptoggle_lb.text = "Show Tip"
        }
    }

    @IBAction func confirmAnswer(sender: AnyObject) {
        let answer = answerarea_fd.text
        if(answer == questions[idx]){
            nextQuestion(sender)
        }else{
            let alert = UIAlertController(title: "Resposta errada", message: "Tente novamente!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        option1_btn?.layer.cornerRadius = 10
        option1_btn?.clipsToBounds = true
        option2_btn?.layer.cornerRadius = 10
        option2_btn?.clipsToBounds = true
        option3_btn?.layer.cornerRadius = 10
        option3_btn?.clipsToBounds = true
        option4_btn?.layer.cornerRadius = 10
        option4_btn?.clipsToBounds = true
        
        fillScreen()
        
        //To hide the keyboard whenever the user tap outside the keyboad or editing area
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

