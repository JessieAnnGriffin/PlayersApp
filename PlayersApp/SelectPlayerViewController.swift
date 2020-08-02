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

    @IBOutlet weak var selectPlayerLabel: UILabel!
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

    override func viewDidLoad() {
        super.viewDidLoad()
        playersTableView.dataSource = self
        playersTableView.delegate = self
        playersTableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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


}
