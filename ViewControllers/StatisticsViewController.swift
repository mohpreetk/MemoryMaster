//
//  StatisticsViewController.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/6/21.
//

import UIKit
import CoreData

class StatisticsViewController: UIViewController {
    
    var stats:[Statistics]!
    
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var lblWon: UILabel!
    
    @IBOutlet weak var lblLost: UILabel!
    
    @IBOutlet weak var lblPercent: UILabel!
    
    @IBOutlet weak var lblBestTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStats()
    }
    
    func setStats() {
        if stats.isEmpty == false && stats![0].totalGamesPlayed != 0{
            let totalGames = stats![0].totalGamesPlayed
            lblTotal.text = "Total Games: " + String(format: "%d", totalGames)
            let gamesWon = stats![0].gamesWon
            lblWon.text = "Games Won: " + String(format: "%d", gamesWon)
            let gamesLost = totalGames - gamesWon
            lblLost.text = "Games Lost: " + String(format: "%d", gamesLost)
            let winPercentage: Float = (Float(gamesWon)/Float(totalGames)) * 100
            lblPercent.text = "Win Percentage: " + String(format: "%.2f", winPercentage) + "%"
            let bestTime = stats![0].bestTime
            if bestTime == 0.0 {
                lblBestTime.text = "Best Time: -"
            }
            else {
                lblBestTime.text = "Best Time: " + String(format: "%.2f", bestTime)
            }
        }
        else {
            lblTotal.text = "Total Games: 0"
            lblWon.text = "Games Won: 0"
            lblLost.text = "Games Lost: 0"
            lblPercent.text = "Win Percentage: 0.0%"
            lblBestTime.text = "Best Time: -"
        }
    }
    
    // Clear everything stored in core data
    @IBAction func btnResetStats(_ sender: UIButton) {
        // User confirmation for the action
        let alert = UIAlertController(title: "Reset Alert", message: "Are you sure you want to reset all data. You will lose all game progress!!!", preferredStyle: .alert)
        
        // Delete statistics object on confirmation
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {action in
            let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Statistics")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            do
                    {
                        try context.execute(deleteRequest)
                        try context.save()
                    }
            catch
            {
                print ("There was an error")
            }
            // Take the user to main menu after stats are deleted
            self.initiateMainMenu()
        }))
        // Go back to stats page on cancellation
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // presenting the alert
        self.present(alert, animated: true)
    }
    
    // Go back to Main Menu
    @IBAction func btnReturn(_ sender: UIButton) {
        self.initiateMainMenu()
    }
    
}
