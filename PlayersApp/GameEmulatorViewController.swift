//
//  GameEmulatorViewController.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit

class GameEmulatorViewController: UIViewController {

    let cornerRadius = 20

    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var playerOneWinsButton: UIButton!
    @IBOutlet weak var playerTwoWinsButton: UIButton!
    @IBOutlet weak var tieButton: UIButton!

    var gameController: GameController?

    override func viewDidLoad() {
        super.viewDidLoad()
        playerOneWinsButton.layer.cornerRadius = CGFloat(cornerRadius)
        playerTwoWinsButton.layer.cornerRadius = CGFloat(cornerRadius)
        tieButton.layer.cornerRadius = CGFloat(cornerRadius)

        updateViews()
    }
    
    @IBAction func player1WinsPressed(_ sender: UIButton) {
        updateScores(sender)
    }

    @IBAction func player2WinsPressed(_ sender: UIButton) {
        updateScores(sender)
    }

    @IBAction func itsATiePressed(_ sender: UIButton) {
        updateScores(sender)
    }

    private func updateViews() {
        guard let playerOne = gameController?.playerOne?.name,
            let playerTwo = gameController?.playerTwo?.name else { return }

        playerOneLabel.text = playerOne
        playerTwoLabel.text = playerTwo

        playerOneWinsButton.setTitle("\(playerOne) Wins!", for: .normal)
        playerTwoWinsButton.setTitle("\(playerTwo) Wins!", for: .normal)
        tieButton.setTitle("It's a tie!", for: .normal)
    }

    func showAlert(player: String) {
        let alertController = UIAlertController(
            title: "Missing player!",
            message: "PLease choose \(player).",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: { _ in
                self.navigationController?.popToRootViewController(animated: true)
        })

        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    func updateScores(_ sender: UIButton) {
        guard let playerOne = gameController?.playerOne else {
            self.showAlert(player: "player one")
            return
        }
        guard let playerTwo = gameController?.playerTwo else {
            self.showAlert(player: "player two")
            return
        }

        switch sender {
        case playerOneWinsButton:
            playerOne.wins += 1
            playerTwo.losses += 1
        case playerTwoWinsButton:
            playerTwo.wins += 1
            playerOne.losses += 1
        case tieButton:
            playerOne.ties += 1
            playerTwo.ties += 1
        default:
            break
        }
    }
}
