//
//  MainMenuViewController.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 7/29/21.
//

import UIKit
import CoreData

// MARK: Main Menu initialization functions
class MainMenuViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // local variable for level difficulty
    var difficulty:String = "Easy"
    
    // core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // array to store core data
    var stats:[Statistics]?
    
    // array for picker view
    var arrayValues: [String] = ["Easy", "Medium", "Hard", "Very Hard" ]
    
    //UI Elements
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // designating the data for picker view
        pickerView.dataSource = self
        pickerView.delegate = self
        
        // fetching the results from core data
        fetchStatistics()
    }
    
    func fetchStatistics() {
        do {
            // getting the data from core data container and storing in an array
            self.stats = try context.fetch(Statistics.fetchRequest())
            // if there is no data, create a new data object with some defaults and rerun the fetchStatistics method. This will ensure only one object of type stats
            if self.stats?.isEmpty == true {
                let newStats = Statistics(context: self.context)
                newStats.bestTime = 0.0
                newStats.gamesWon = 0
                newStats.totalGamesPlayed = 0
                try self.context.save()
                fetchStatistics()
            }
        }
        catch {
            print("An error occured while fetching data")
        }
    }
}
