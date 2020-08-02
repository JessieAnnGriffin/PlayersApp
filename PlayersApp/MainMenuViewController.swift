//
//  MainMenuViewController.swift
//  PlayersApp
//
//  Created by Jessie Ann Griffin on 8/2/20.
//  Copyright © 2020 Jessie Griffin. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
