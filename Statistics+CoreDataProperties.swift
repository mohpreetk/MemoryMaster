//
//  Statistics+CoreDataProperties.swift
//  MemoryMaster
//
//  Created by user192667 on 8/5/21.
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

}

extension Statistics : Identifiable {

}
