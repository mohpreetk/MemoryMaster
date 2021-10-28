//
//  ThemeViewController.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/9/21.
//

import UIKit

class ThemeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
      
    var backThemes: [String] = ["Streaked" , "Confetti" , "Pink"]
    var frontThemes: [String] = ["Emojis", "Flowers"]
    var themes: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentedSwitch: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let footer = UIView()
        footer.backgroundColor = .darkGray
        self.tableView.tableFooterView = footer
        if segmentedSwitch.selectedSegmentIndex == 0 {
        
            // setting the table array to back themes
            themes = backThemes
            
        }
        else if segmentedSwitch.selectedSegmentIndex == 1 {
            
            // setting the table array to front themes
            themes = frontThemes
        }
    }
    
    // MARK: Protocol Implementation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        // creating the reuseable cell and setting the values to outlets
        let tempCell:ThemesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ThemesTableViewCell
        tempCell.labelThemeName.text = themes[indexPath.row]
        
        return tempCell
    }

    // on select action
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themes.count
    }
    
    // on select action
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segmentedSwitch.selectedSegmentIndex == 0 {
        
            // setting the table array to back themes
            GameModel.backImage = "tile_backs/" + themes[indexPath.row]
            
        }
        else if segmentedSwitch.selectedSegmentIndex == 1 {
            
            // setting the table array to front themes
            GameModel.frontImageSet = themes[indexPath.row]
        }
    }
    
    // MARK: Segmented Control Logic
    
    @IBAction func segmentedSelectionChanged(_ sender: UISegmentedControl) {
        if segmentedSwitch.selectedSegmentIndex == 0 {
        
            // setting the table array to back themes
            themes = backThemes
            
        }
        else if segmentedSwitch.selectedSegmentIndex == 1 {
            
            // setting the table array to front themes
            themes = frontThemes
        }
        tableView.reloadData()
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        // all the saving is simultaneously done in did select method. Nothing required here
        self.initiateMainMenu()
    }
    
}
