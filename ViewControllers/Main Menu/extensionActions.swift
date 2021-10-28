//
//  extensionActions.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/7/21.
//

import Foundation
import UIKit

// MARK: Main Menu action buttons and their functions
extension MainMenuViewController {
    
    // Action when New Game is pressed from the main menu
    @IBAction func btnNewGame(_ sender: UIButton) {
        pickerView.isHidden = false
        btnNext.isHidden = false
        stackView.isHidden = true
    }

    // Action when Next is pressed from the picker view selection
    @IBAction func btnNext(_ sender: UIButton) {
        // creating the object to be passed to new view
        let gameBoard:GameViewController = self.storyboard?.instantiateViewController(withIdentifier: "gameBoard") as! GameViewController

        gameBoard.difficulty = difficulty
        let statsObject: Statistics? = stats?[0]
        gameBoard.statsObject = statsObject
        // setting the modal to full screen
        gameBoard.modalPresentationStyle = .fullScreen
        // presenting the new view
        present(gameBoard, animated: true)
    }
    
    // Action when Statistics is pressed from the Main Menu
    @IBAction func btnStatistics(_ sender: UIButton) {
        // creating the object to be passed to new view
        let gameStats:StatisticsViewController = self.storyboard?.instantiateViewController(withIdentifier: "gameStats") as! StatisticsViewController
    
        gameStats.stats = self.stats
        // setting the modal to full screen
        gameStats.modalPresentationStyle = .fullScreen
        // presenting the new view
        present(gameStats, animated: true)
    }
    
    // main menu button to open themes view
    @IBAction func btnThemes(_ sender: UIButton) {
        // creating the object to be passed to new view
        let themes:ThemeViewController = self.storyboard?.instantiateViewController(withIdentifier: "themes") as! ThemeViewController
    
        // setting the modal to full screen
        themes.modalPresentationStyle = .fullScreen
        // presenting the new view
        present(themes, animated: true)
    }
    
    // main menu button to open help
    @IBAction func btnHelp(_ sender: UIButton) {
        // creating the object to be passed to new view
        let gameHelp:HelpViewController = self.storyboard?.instantiateViewController(withIdentifier: "gameHelp") as! HelpViewController
    
        // setting the modal to full screen
        gameHelp.modalPresentationStyle = .fullScreen
        // presenting the new view
        present(gameHelp, animated: true)
    }
    
    
    // main menu button to exit the app
    @IBAction func btnExit(_ sender: UIButton) {
        // creating a confirmation alert
        let alert = UIAlertController(title: "Exit Alert", message: "Are you sure you want to exit", preferredStyle: .alert)

        // this method is used because Apple does not recommend Exit feature as it crashes the App
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)}))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

        // presenting the alert
        self.present(alert, animated: true)
    }
}
