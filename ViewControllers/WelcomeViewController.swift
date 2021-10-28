//
//  ViewController.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 7/29/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextClicked(_ sender: UITapGestureRecognizer) {
        self.initiateMainMenu()
    }
}

