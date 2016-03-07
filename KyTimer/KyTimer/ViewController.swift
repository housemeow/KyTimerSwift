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
    var timer: NSTimer? = nil;
    var minute: Double = 0;
    var content: String = "要做事啦！";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fireTimer(sender: AnyObject) {
        minute =  self.stringToNumber(timerTextField.stringValue);
        timer = NSTimer.scheduledTimerWithTimeInterval(minute*60, target: self, selector: "update", userInfo: nil, repeats: false)
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func playMusic(name: String) {
        let sound = NSSound(named: name);
        sound?.play();
    }
    
    func stringToNumber(string: String)->Double {
        return NSString(string: string).doubleValue;
    }
    
    func update() {
        print("Minute:" + String(minute));
        self.playMusic("pikapi.mp3");
        self.showDialog("KyTimer", content: self.content);
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

