//
//  PlayerController.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import Foundation
import CoreData

class PlayerController {

    private let moc = CoreDataStack.shared.mainContext

    func createPlayer(name: String) {
        let _ = Player(name: name)
        try? CoreDataStack.shared.save(context: moc)
    }

    func updatePlayer(player: Player, name: String) {
        player.name = name
        try? CoreDataStack.shared.save(context: moc)
    }

    func deletePlayer(player: Player) {
        moc.delete(player)
        try? CoreDataStack.shared.save(context: moc)
    }
}
