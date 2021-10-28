//
//  GameViewController.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 7/29/21.
//

import UIKit

// MARK: Initialization and Menu methods
class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var difficulty: String! = "Easy"
    var noOfPairs: Int = 8
    var model = GameModel()
    var tileArray = [Tile]()
    var firstSelectedTileIndex:IndexPath?
    var timer:Timer?
    var milliseconds: Float = 0
    weak var statsObject: Statistics?
    
    @IBOutlet weak var labelTimer: UILabel!
    
    @IBOutlet weak var tileCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Decide Number of pairs according to difficulty
        setNoOfTilePairs(difficulty)
        
        // Create the required Tiles
        tileArray = model.getTiles(noOfPairs)
        
        // start timer
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
            RunLoop.main.add(timer!, forMode: .common)
        
        // increase the number of games played by one
        statsObject?.totalGamesPlayed += 1
        do{
        try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.save()
        }
        catch {
            print("An error occured while updating game stats")
        }
    } // end viewDidLoad()
    
    // timer execution
    @objc func timerElapsed(){
        milliseconds += 1
        let seconds = String(format: "%.2f", milliseconds/1000)
        labelTimer.text = "\(seconds)"
    }
    
    func setNoOfTilePairs(_ difficulty: String) {
        switch difficulty {
        case "Medium":
            noOfPairs = 8
        case "Hard":
            noOfPairs = 10
        case "Very Hard":
            noOfPairs = 12
        default:
            noOfPairs = 6
        }
    }
    
    // method executed when pause icon is clicked
    @IBAction func pauseClicked(_ sender: Any) {
        
        // create an alert
        let alert = UIAlertController(title: "Game Paused", message: "Note: Time still running out", preferredStyle: .actionSheet)
        
        // add actions to alert
        alert.addAction(UIAlertAction(title: "Restart", style: UIAlertAction.Style.default, handler: {action in
                                        
            // create a new view to reload
            let gameBoard:GameViewController = self.storyboard?.instantiateViewController(withIdentifier: "gameBoard") as! GameViewController
            // call the new game with same difficulty as current
            gameBoard.difficulty = self.difficulty
            // setting the modal to full screen
            gameBoard.modalPresentationStyle = .fullScreen
                                        
            // presenting the new view
            self.present(gameBoard, animated: true)
        })) // end alert new game
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.destructive, handler:
            {action in
                let alert = UIAlertController(title: "Exit Alert", message: "Are you sure you want to exit", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in self.initiateMainMenu()}))
                
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                // presenting the alert
                self.present(alert, animated: true)
            })) // end alert exit

        // show the alert
        self.present(alert, animated: true, completion: nil)
    } // end pausesClicked()
}
