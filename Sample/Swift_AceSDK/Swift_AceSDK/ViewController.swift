//
//  ViewController.swift
//  Swift_AceSDK
//
//  Created by jinsang yoo on 2018. 6. 22..
//  Copyright © 2018년 NHN Ace. All rights reserved.
//

import UIKit
import AceTM

class ViewController: UIViewController {
    @IBOutlet weak var pv: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AceTM.viewDidLoad(responder: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pvClicked(_ sender: UIButton) {
        print("\(#function) clicked")
        AceTM.pv(responder: self)
    }
    
    // MARK: - Segue
    
    @IBAction func returnFromSegueActions(segue:UIStoryboardSegue){
        if let segueIdentifier = segue.identifier {
            print("segueIdentifier: \(segueIdentifier)")
        }
    }
}

