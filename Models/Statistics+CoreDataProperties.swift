//
//  Statistics+CoreDataProperties.swift
//  MemoryMaster
//
//  Created by Mohpreet Kaur on 8/6/21.
//
//

import Foundation
import CoreData


extension Statistics {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Statistics> {
        return NSFetchRequest<Statistics>(entityName: "Statistics")
    }

    @NSManaged public var gamesWon: Int32
    @NSManaged public var totalGamesPlayed: Int32
    @NSManaged public var bestTime: Float

}

extension Statistics : Identifiable {

}
