//
//  DoStepsController.swift
//  MGM
//
//  Created by artash on 13/06/14.
//  Copyright (c) 2014 Karlen Kishmiryan. All rights reserved.
//

import UIKit

class DoStepsController: UIViewController {
    
    var timerInMiliseconds = 0.0
    
    var letterIndex = 0
    
    var timerStoped = false
    
    
    let firstStepLabelRec = CGRectMake(10, 60, 200, 30)
    let secondStepLabelRec = CGRectMake(10, 90, 200, 30)
    let thirdStepLabelRec = CGRectMake(10, 120, 200, 30)
    
    let timerLabelRec = CGRectMake(110, 100, 120, 30)
    
    
    @lazy var firstStepLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size:16)
        return label
    }()

    @lazy var secondStepLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size:16)
        return label
        }()
    
    @lazy var thirdStepLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size:16)
        return label
        }()
    
    @lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Helvetica", size:16)
        return label;
    }()

    var stepsArray:String[] = []
    
    let steps = [
        "At first all close their eyes",
        "Mafia open eyes , do appointment and choose their first 3 victimes",
        "Now all open their eyes"
    ]
    
    func stringToArray(str:String)->String[] {

        var arr:String[] = []

        for letter in str {
            arr.append(String(letter))
        }
        
        return arr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        setupView()
        
        stepsArray = stringToArray(steps[0])

        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "blinkFirstStep", userInfo: nil, repeats: true)
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "blinkSecondStep", userInfo: nil, repeats: true)
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "blinkThirdStep", userInfo: nil, repeats: true)
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerStart", userInfo: nil, repeats: true)
        
        self.view.addSubview(firstStepLabel)
        self.view.addSubview(timerLabel)
    }
    
    func setupView() {
        firstStepLabel.frame = firstStepLabelRec
        secondStepLabel.frame = firstStepLabelRec
        thirdStepLabel.frame = firstStepLabelRec
        
        timerLabel.frame = timerLabelRec
        
        firstStepLabel.text = ""
        secondStepLabel.text = ""
        thirdStepLabel.text = ""
        timerLabel.text = "0.0"
    }
    
    func blinkFirstStep(){

        if (!timerStoped) {
            if stepsArray.count > letterIndex {
                firstStepLabel.text = firstStepLabel.text + stepsArray[letterIndex]
                letterIndex += 1
            }
        }
    }
    
    func blinkSecondStep() {

    }
    
    func blinkThirdStep(){
        
    }
    
    func timerStart() {
        
        timerInMiliseconds += 0.1
        println(timerInMiliseconds)
        timerLabel.text = String(timerInMiliseconds)
    }
    
    
}
