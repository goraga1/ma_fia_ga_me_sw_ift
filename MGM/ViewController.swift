//
//  ViewController.swift
//  MGM
//
//  Created by Karlen Kishmiryan on 6/13/14.
//  Copyright (c) 2014 Karlen Kishmiryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let createButtonRect = CGRect(x: 0, y: 0, width: 200, height: 50)
    let createButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let playerController: PlayerController = {
        let controller = PlayerController()
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.frame = createButtonRect
        createButton.center = CGPointMake(160.0, 240.0)
        createButton.setTitle("Create new game", forState: UIControlState.Normal)
        createButton.backgroundColor = UIColor.redColor()
        createButton.addTarget(self, action: "createNewGame", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(createButton)
    }
    
    func createNewGame() {
        println("It works")
        self.presentViewController(playerController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

