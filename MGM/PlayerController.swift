//
//  PlayerController.swift
//  MGM
//
//  Created by Karlen Kishmiryan on 6/13/14.
//  Copyright (c) 2014 Karlen Kishmiryan. All rights reserved.
//

import UIKit

protocol PlayerDelegate {
    func getPlayersList(playersList: String[])
}

class PlayerController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataSource: String[] = []
    var delegate: PlayerDelegate?
    
    let playerNameFieldRect = CGRect(x: 5, y: 30, width: 265, height: 50)
    let playerNameField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let leftPaddingRect = CGRectMake(0, 0, 10, 50)
    let leftPadding: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let addButtonRect = CGRect(x: 270, y: 30, width: 50, height: 50)
    let addButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let nextButtonRect = CGRect(x: 0, y: UIScreen.mainScreen().bounds.size.height - 45, width: UIScreen.mainScreen().bounds.size.width, height: 45)
    let nextButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let tableViewRect = CGRectMake(0, 85, 320, UIScreen.mainScreen().bounds.size.height - 135)
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let doStepsController: DoStepsController = {
        let controller = DoStepsController()
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Player name field
        
        playerNameField.frame = playerNameFieldRect
        playerNameField.placeholder = "Input player name"
        playerNameField.backgroundColor = UIColor.whiteColor()
        playerNameField.layer.autoContentAccessingProxy
        playerNameField.leftViewMode = UITextFieldViewMode.Always
        playerNameField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        leftPadding.backgroundColor = UIColor.clearColor()
        playerNameField.leftView = leftPadding
        self.view.addSubview(playerNameField)
        
        // Add button
        
        addButton.frame = addButtonRect
        addButton.setTitle("+", forState: .Normal)
        addButton.backgroundColor = UIColor.grayColor()
        addButton.addTarget(self, action: "addNewPlayer", forControlEvents: .TouchUpInside)
        self.view.addSubview(addButton)
        
        // Player list view
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.frame = tableViewRect
        self.view.addSubview(tableView)
        
        // Next button
        
        nextButton.frame = nextButtonRect
        nextButton.setTitle("Next", forState: .Normal)
        nextButton.backgroundColor = UIColor.greenColor()
        nextButton.addTarget(self, action: "goToStepsPage", forControlEvents: .TouchUpInside)
        self.view.addSubview(nextButton)
        
    }
    
    // Add button handler
    
    func addNewPlayer() {
//        dataSource[0] += playerNameField.text
        dataSource.append(playerNameField.text)
        playerNameField.text = ""
        tableView.reloadData()
    }
    
    // Next button handler
    
    func goToStepsPage() {
        self.presentViewController(doStepsController, animated: true, completion: nil)
    }
    
    // Table view delegate
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath!) as UITableViewCell
        
        if let path = indexPath {
            let currentString = dataSource[path.row]
            
            if currentString != nil {
                cell.text = toString(currentString)
            }
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath)
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
//        switch(section) {
//        case 0:
//            return "Citizen"
//        case 1:
//            return "Mafia"
//        default:
//            return ""
//        }
        return "Players"
    }
    
    
}

















































