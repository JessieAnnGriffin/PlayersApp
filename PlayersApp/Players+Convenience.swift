//
//  Players+Convenience.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import Foundation
import CoreData

extension Player {
    convenience init(name: String,
                                     wins: Int32 = 0,
                                     losses: Int32 = 0,
                                     ties: Int32 = 0,
                                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.name = name
        self.wins = wins
        self.losses = losses
        self.ties = ties
    }
}
