//
//  extensionCollectionView.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/7/21.
//

import Foundation
import UIKit

// MARK: Collection View Protocol Implementation
extension GameViewController {
    
    // No of tiles
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tileArray.count
    }
    
    // Reusing cells to create new
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create a cell at index path as Tile Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TileCollectionViewCell
        
        // Get the tile to display from array
        let tile = tileArray[indexPath.row]
        
        // set the image for the tile front
        cell.setTile(tile)
        
        return cell
    }
    
    // actions when a tile is selected
    // NOTE: Selected tile is the tile placed inside the selected cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // get the selected cell
        let selectedCell = collectionView.cellForItem(at: indexPath) as! TileCollectionViewCell
        
        // get the selected tile
        let selectedTile = tileArray[indexPath.row]
        
        if selectedTile.isShown == false && selectedTile.isMatched == false {
            
            // flip the card up
            selectedCell.flipUp()
            
            // reverse the property value
            selectedTile.isShown = true
            
            // check if it is first flipped tile or second
            if firstSelectedTileIndex == nil {
                firstSelectedTileIndex = indexPath
            }
            else {
                checkForMatchedTiles(indexPath)
            }
        }
    }
}
