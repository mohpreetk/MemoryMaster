//
//  HelpViewController.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 7/30/21.
//

import UIKit

class HelpViewController: UIViewController {
    
    // storing the written instructions in a string
    var instructions: String = "1. Select the level of difficulty for your game . The number of pairs will be determined by your level of difficulty. \n2. Start matching the pairs on the board. You can only see two tiles at a time.\n3. Remember the placement of tiles that face down and try to make a match with other of same kind.\n4. When you match all the tiles, you win the game.\n5. Try to make the matches as fast as possible as your best time will be recorded.\nNOTE: An unfinished game counts towards a loss"

    @IBOutlet weak var lblInstructions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // populating instruction on view load
        lblInstructions.text = instructions
    }

    // Go back to Main Menu
    @IBAction func btnReturn(_ sender: UIButton) {
        self.initiateMainMenu()
    }
}
