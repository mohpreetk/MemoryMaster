//
//  TileCollectionViewCell.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/4/21.
//

import UIKit

class TileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tileFrontImage: UIImageView!
    
    @IBOutlet weak var tileBackImage: UIImageView!
    
    var tile:Tile?
    
    func setTile(_ tile:Tile) {
        self.tile = tile
        
        tileFrontImage.image = UIImage(named: tile.tileImage)
        tileBackImage.image = UIImage(named: GameModel.backImage)
        
        if tile.isMatched == true {
            // if the tile is matched, make the imageviews invisible and do not execute anything. Catching reusability errors
            tileBackImage.alpha = 0
            tileFrontImage.alpha = 0
            
            return
        }
        else {
            // if the tile is not matched, make the imageviews visible and execute the below code
            tileBackImage.alpha = 1
            tileFrontImage.alpha = 1
        }
        
        if tile.isShown == true {
            UIView.transition(from: tileBackImage, to: tileFrontImage, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            UIView.transition(from: tileFrontImage, to: tileBackImage, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flipUp() {
        UIView.transition(from: tileBackImage, to: tileFrontImage, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipDown() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.tileFrontImage, to: self.tileBackImage, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
    }
    
    // remove matched cards from view
    func remove() {
        tileBackImage.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.tileFrontImage.alpha = 0
        }, completion: nil)
    }
}
