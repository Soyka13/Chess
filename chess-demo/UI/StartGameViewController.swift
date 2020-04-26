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
    
    @IBOutlet weak var blackPlayerTF: UITextField!
    @IBOutlet weak var whitePlayerTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameButton.layer.cornerRadius = startGameButton.frame.size.height/2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is BoardViewController{
            let vc = segue.destination as? BoardViewController
            if let text = blackPlayerTF.text {
                vc?.playersName.black = text != "" ? text : "Black Player"
            }
            if let text = whitePlayerTF.text {
                vc?.playersName.white = text != "" ? text : "White Player"
            }
        }
    }
    
    @IBAction func startGameTapped(_ sender: Any) {
        //        performSegue(withIdentifier: "goToGame", sender: nil)
        navigationController?.popViewController(animated: true)
    }
    
    
}

