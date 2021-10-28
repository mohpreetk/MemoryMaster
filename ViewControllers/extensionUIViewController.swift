//
//  extensionUIViewController.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/7/21.
//

import UIKit

// MARK: Creating a common method for all view controllers

extension UIViewController {
    // function to come to main menu from anywhere in the game
    func initiateMainMenu() {
        let mainMenu:MainMenuViewController = self.storyboard?.instantiateViewController(withIdentifier: "mainMenu") as! MainMenuViewController
        
        // setting the modal to full screen
        mainMenu.modalPresentationStyle = .fullScreen
        // presenting the new view
        present(mainMenu, animated: true)
    }
}
