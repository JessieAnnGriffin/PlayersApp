//
//  MainMenuViewController.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    let playerController = PlayerController()
    let gameController = GameController()
    let cornerRadius = 20

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scoreboardButton: UIButton!
    @IBOutlet weak var playerOneButton: UIButton!
    @IBOutlet weak var playerTwoButton: UIButton!
    @IBOutlet weak var addPlayerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = CGFloat(cornerRadius)
        scoreboardButton.layer.cornerRadius = CGFloat(cornerRadius)
        playerOneButton.layer.cornerRadius = CGFloat(cornerRadius)
        playerTwoButton.layer.cornerRadius = CGFloat(cornerRadius)
        addPlayerButton.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {
        case "ShowSelectPlayer1":
            if let selectPlayerVC = segue.destination as? SelectPlayerViewController {
                selectPlayerVC.title = "Select Player 1"
                selectPlayerVC.gameController = gameController
                selectPlayerVC.playerController = playerController
            }
        case "ShowSelectPlayer2":
            if let selectPlayerVC = segue.destination as? SelectPlayerViewController {
                selectPlayerVC.title = "Select Player 2"
                selectPlayerVC.gameController = gameController
                selectPlayerVC.playerController = playerController
            }
        case "ShowGameEmulator":
            if let gameVC = segue.destination as? GameEmulatorViewController {
                gameVC.gameController = gameController
                gameVC.playerController = playerController
            }
        default:
            return
        }
    }

    @IBAction func addPlayer(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Add a new player.",
                                                message: "Enter a name",
                                                preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Player Name"
        }
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (alert) in
            let newPlayerTextField = alertController.textFields![0] as UITextField
            if let newPlayer = newPlayerTextField.text {
                self.playerController.createPlayer(name: newPlayer)
            }
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
}
