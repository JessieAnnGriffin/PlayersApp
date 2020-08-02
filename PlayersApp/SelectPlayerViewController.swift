//
//  SelectPlayerViewController.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit
import CoreData

class SelectPlayerViewController: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var playersTableView: UITableView!

    private lazy var fetchedResultsController: NSFetchedResultsController<Player> = {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "wins", ascending: true),
            NSSortDescriptor(key: "name", ascending: true)
        ]
        let moc = CoreDataStack.shared.mainContext
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: moc,
                                             sectionNameKeyPath: "wins",
                                             cacheName: nil)
        frc.delegate = self
        try! frc.performFetch()
        return frc
    }()

    var gameController: GameController?

    override func viewDidLoad() {
        super.viewDidLoad()
        playersTableView.dataSource = self
        playersTableView.delegate = self
        playersTableView.reloadData()
    }
}

extension SelectPlayerViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = playersTableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerTableViewCell
            else { return UITableViewCell() }
        let player = fetchedResultsController.object(at: indexPath)
        cell.player = player
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = fetchedResultsController.object(at: indexPath)
        showAlert(player: player)
        if title == "Select Player 1" {
            gameController?.playerOne = player
        } else {
            gameController?.playerTwo = player
        }
    }

    func showAlert(player: Player) {
        guard let player = player.name else { return }
        if title == "Select Player 1" {
            let alertController = UIAlertController(
                title: "Player One is \(player)",
                message: "",
                preferredStyle: .alert)
            let alertAction = UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default,
                handler: { _ in
                    self.navigationController?.popToRootViewController(animated: true)
            })
            alertController.addAction(alertAction)
            self.present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(
                title: "Player Two is \(player)",
                message: "",
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
    }
}
