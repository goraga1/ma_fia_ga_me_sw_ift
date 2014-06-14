//
//  GenerateController.swift
//  MGM
//
//  Created by Gor on 6/13/14.
//  Copyright (c) 2014 Karlen Kishmiryan. All rights reserved.
//

import UIKit

class GenerateController : UIViewController {

    
    let array = ["Mafia","Mafia", "Citizen", "Citizen", "Citizen", "Citizen", "Citizen","Citizen","Citizen","Sheriff", "Don"]
    
        let pArray = ["p1","p2", "p3", "p4", "p5", "p6", "p7","p8","p9","p10", "p11"]
     var imageView = UIImageView(frame: CGRectMake(100, 150, 150, 150));
      var label = UILabel(frame: CGRectMake(0, 0, 200, 21))
    
    
    var sheriff = UIImage(named: "Sheriff.png");
    var don = UIImage(named: "Don.png");
    var mafia = UIImage(named: "Mafia.png");
    var citizen = UIImage(named: "Citizen.jpg");
    
    let cButtonRect = CGRect(x: 0 , y:0 ,width:200 , height:50)
    let cButton: UIButton = {
        let bt = UIButton()
        return bt
        }()
    
    let cImageView = CGRect(x: 0 , y:0 ,width:600 , height:450)
    let cView: UIImage = {
        let im = UIImage()
        return im
        }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor();
        cButton.frame = cButtonRect
        cButton.center=CGPointMake(160, 460)
        cButton.setTitle("Create new game", forState: UIControlState.Normal)
        cButton.backgroundColor = UIColor.blueColor()
        cButton.addTarget(self, action: "genCards", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(cButton)
        
        
       
        

        
        

        
        
        
    }
    
    
    
    func genCards() {
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))

        
        switch array[randomIndex] {
        case "Mafia":
            println("mafia!")
            imageView.image = mafia;
        case "Sheriff":
            println("Sheriff")
                  imageView.image = sheriff;
        case "Don":
            println("Don")
              imageView.image = don;
        case "Citizen":
               imageView.image = citizen;
            println("citi")
        
        default:
                println("222")
        }
        
        
        
      
        label.center = CGPointMake(160, 384)
        label.textAlignment = NSTextAlignment.Center
        label.text = pArray[randomIndex]
        self.view.addSubview(label)
    
   
        
        
        
        self.view.addSubview(imageView);
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
