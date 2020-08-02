//
//  PlayerTableViewCell.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    // MARK: Properties
    var player: Player? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        textLabel!.text = player?.name
    }
}
