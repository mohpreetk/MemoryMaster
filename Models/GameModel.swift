//
//  GameModel.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/4/21.
//

import Foundation
import UIKit

class GameModel {
    
    // var to store tile themes
    static var backImage: String = "tile_backs/Streaked"
    static var frontImageSet: String = "Emojis"
    
    // generate the random tiles
    func getTiles(_ noOfTilePairs: Int) -> [Tile] {
        // an array to store generated tiles
        var tileArray = [Tile]()
        
        // an array to store random numbers
        var randomNumbers = [Int]()
        
        // loop to generate tiles with different images
        while randomNumbers.count < noOfTilePairs {
                       
            let randomNumber = arc4random_uniform(12) + 1
            
            // creating unique random numbers
            if randomNumbers.contains(Int(randomNumber)) == false {
                randomNumbers.append(Int(randomNumber))
                let tileOne = Tile()
                tileOne.tileImage = "tile_fronts/" + GameModel.frontImageSet + "/tile" + String(randomNumber)
        
                tileArray.append(tileOne)
                
                let matchingTile = Tile()
                matchingTile.tileImage = "tile_fronts/" + GameModel.frontImageSet + "/tile" + String(randomNumber)
                
                tileArray.append(matchingTile)
            }
        }
        
        // randomize the tiles in array
        tileArray.shuffle()
        return tileArray
    }
}
