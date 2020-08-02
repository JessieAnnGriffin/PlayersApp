//
//  PlayerScoreTableViewCell.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit

class PlayerScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var lossesLabel: UILabel!
    @IBOutlet weak var tiesLabel: UILabel!

    var player: Player? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
//        if let player = player {
//            nameLabel.text = player.name
//            winsLabel.text = "\(player.wins)"
//            lossesLabel.text = "\(player.losses)"
//            tiesLabel.text = "\(player.ties)"
//        }

        nameLabel.text = player?.name
        winsLabel.text = "\(String(describing: player?.wins))"
        lossesLabel.text = "\(String(describing: player?.losses))"
        tiesLabel.text = "\(String(describing: player?.ties))"
    }
}
