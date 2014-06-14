//
//  GenerateController.swift
//  MGM
//
//  Created by Gor on 6/13/14.
//  Copyright (c) 2014 Karlen Kishmiryan. All rights reserved.
//

import UIKit



class GenerateController : UIViewController {
    
    var roles = ["Mafia","Mafia", "Citizen", "Citizen", "Citizen", "Citizen", "Citizen","Citizen","Citizen","Sheriff", "Don"]
    var players: String[] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
    var playerFinalList: String[][] = [[], []]
    
    var imageView = UIImageView(frame: CGRectMake(0, 30, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 130));
    var label = UILabel(frame: CGRectMake(0, UIScreen.mainScreen().bounds.size.height - 75, UIScreen.mainScreen().bounds.size.width, 20))
    
    
    let sheriff = UIImage(named: "Sheriff.png");
    let don = UIImage(named: "Don.png");
    let mafia = UIImage(named: "Mafia.png");
    let citizen = UIImage(named: "Citizen.jpg");
    
    let cButtonRect = CGRect(x: 0 , y:UIScreen.mainScreen().bounds.size.height - 95, width:200 , height:50)
    let cButton: UIButton = {
        let bt = UIButton()
        return bt
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor();
        
        self.view.addSubview(imageView);
        
        cButton.frame = cButtonRect
        cButton.center = CGPoint(x: UIScreen.mainScreen().bounds.size.width / 2, y: UIScreen.mainScreen().bounds.size.height - 30)
        cButton.setTitle("Next player", forState: UIControlState.Normal)
        cButton.backgroundColor = UIColor.blueColor()
        cButton.addTarget(self, action: "generateNext", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(cButton)
    }
    
    
    
    func generateNext() {
        println(roles.count)
        if roles.count == 0 {
            self.presentViewController(PlayerController(), animated: true, completion: nil)
            println(playerFinalList)
            return
        }
        
        let randomIndex = roles.count == 1 ? 0 : Int(arc4random_uniform(UInt32(roles.count)))
        let role = roles[randomIndex]
        let player = players[randomIndex]
        
        switch role {
        case "Mafia":
            imageView.image = mafia;
            playerFinalList[0] += player
        case "Sheriff":
            imageView.image = sheriff;
            playerFinalList[1] += player
        case "Don":
            imageView.image = don;
            playerFinalList[0] += player
        case "Citizen":
            imageView.image = citizen;
            playerFinalList[1] += player
        default:
            println("Unknown role")
        }
        
        roles.removeAtIndex(randomIndex)
        players.removeAtIndex(randomIndex)
        
        label.center = CGPoint(x: UIScreen.mainScreen().bounds.size.width / 2, y: UIScreen.mainScreen().bounds.size.height - 80)
        label.textAlignment = NSTextAlignment.Center
        label.text = player
        self.view.addSubview(label)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
