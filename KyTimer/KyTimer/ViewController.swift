//
//  ViewController.swift
//  KyTimer
//
//  Created by 楊凱霖 on 3/7/16.
//  Copyright © 2016 楊凱霖. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var contentTextField: NSTextField!
    @IBOutlet weak var timerTextField: NSTextField!
    @IBOutlet weak var timerButton: NSButton!
    var minute: Double = 0;
    var todo: String = "";
    var timer: NSTimer? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fireTimer(sender: AnyObject) {
        self.updateModel();
        self.updateView();
        timer = NSTimer.scheduledTimerWithTimeInterval(minute*60, target: self, selector: "timesUp", userInfo: nil, repeats: false)
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func updateModel() {
        self.todo = self.contentTextField.stringValue;
        self.minute =  self.stringToNumber(timerTextField.stringValue);
    }
    
    func updateView() {
        self.contentTextField.enabled = false;
        self.timerTextField.enabled = false;
        self.timerButton.enabled = false;
    }
    
    func playMusic(name: String) {
        let sound = NSSound(named: name);
        sound?.play();
    }
    
    func stringToNumber(string: String)->Double {
        return NSString(string: string).doubleValue;
    }
    
    func timesUp() {
        print("Minute:" + String(minute));
        self.playMusic("pikapi.mp3");
        self.showDialog("KyTimer", content: self.todo);
    }
    
    func showDialog(title: String, content: String) {
        let alert = NSAlert();
        alert.addButtonWithTitle("Ok");
        alert.messageText = "KyTimer";
        alert.informativeText = content;
        alert.runModal();
        exit(0);
    }
}

