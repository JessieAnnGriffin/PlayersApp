//
//  ScoreboardTableViewController.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit
import CoreData

class ScoreboardTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var playerController: PlayerController?
    var gameController: GameController?

    private lazy var fetchedResultsController: NSFetchedResultsController<Player> = {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]
        let moc = CoreDataStack.shared.mainContext
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest,
                                             managedObjectContext: moc,
                                             sectionNameKeyPath: "name",
                                             cacheName: nil)
        frc.delegate = self
        try! frc.performFetch()
        return frc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections?[section].numberOfObjects ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerScoreCell", for: indexPath) as? PlayerScoreTableViewCell
            else { return UITableViewCell() }
        let player = fetchedResultsController.object(at: indexPath)
        cell.player = player
        return cell
    }
}
