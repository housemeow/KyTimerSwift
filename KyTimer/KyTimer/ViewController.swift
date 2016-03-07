//
//  ViewController.swift
//  KyTimer
//
//  Created by 楊凱霖 on 3/7/16.
//  Copyright © 2016 楊凱霖. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var timerTextField: NSTextField!
    
    @IBAction func clickButton(sender: AnyObject) {
        print(timerTextField.stringValue);
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

