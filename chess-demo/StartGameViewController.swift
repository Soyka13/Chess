//
//  StartGameViewController.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 17.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {

    @IBOutlet weak var startGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameButton.layer.cornerRadius = startGameButton.frame.size.height/2
    }

    @IBAction func startGameTapped(_ sender: Any) {
        performSegue(withIdentifier: "goToGame", sender: nil)
    }
}
