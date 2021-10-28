//
//  extensionGameLogic.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/7/21.
//

import Foundation
import UIKit

// MARK: Game Logic - When to flip/match/remove/end
extension GameViewController {
    
    func checkForMatchedTiles(_ secondSelectedTileIndex: IndexPath) {
        
        let firstTileCell = tileCollectionView.cellForItem(at: firstSelectedTileIndex!) as? TileCollectionViewCell
        
        let secondTileCell = tileCollectionView.cellForItem(at: secondSelectedTileIndex) as? TileCollectionViewCell
        
        let tileOne = tileArray[firstSelectedTileIndex!.row]
        let tileTwo = tileArray[secondSelectedTileIndex.row]
        
        if tileOne.tileImage == tileTwo.tileImage {
            // set the tiles to matched
            tileOne.isMatched = true
            tileTwo.isMatched = true
            // remove the cells of matched tiles
            firstTileCell?.remove()
            secondTileCell?.remove()
            checkEndGame()
        }
        else {
            // change the shown status of tiles
            tileOne.isShown = false
            tileTwo.isShown = false
            // flip the tiles down
            firstTileCell?.flipDown()
            secondTileCell?.flipDown()
        }
        // reload the card after scroll back, addressing reuseability errors
        if firstTileCell == nil {
            tileCollectionView.reloadItems(at: [firstSelectedTileIndex!])
        }
        firstSelectedTileIndex = nil
    }
    
    func checkEndGame() {
        
        var isWon = true
        
        for tile in tileArray {
            
            if tile.isMatched == false {
                isWon = false
                break
            }
        }
        
        var message = ""
        if isWon == true {
            timer?.invalidate()
            title = "Congratulations"
            message = "You Won"
            statsObject?.gamesWon += 1
            let bestTime: Float = Float(labelTimer.text!)!
            if bestTime < statsObject!.bestTime || statsObject!.bestTime == 0.0{
                statsObject?.bestTime = bestTime
            }
            do{
                try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.save()
            }
            catch {
                print("An error occured while updating game stats")
            }
        }
        else {
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Back to Main Menu", style: .default, handler: {action in self.initiateMainMenu()})
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
