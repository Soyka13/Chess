//
//  BoardViewController.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController, GameEventDelegate {
    @IBOutlet weak var boardView: BoardView!
    
    @IBOutlet weak var blackPlayerLabel: UILabel!
    @IBOutlet weak var whitePlayerLabel: UILabel!
    
    var playersName = (black : "", white : "")
    
    var gameController : GameController?
    var chessEngine = ChessEngine()
    var currentPlayer : Player?
    
    private var alertTitle = ""
    private var alertMessage = ""
    private var alertActionTitle = "OK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameController = GameController(playersName.white, playersName.black)
        
        blackPlayerLabel?.text = playersName.black
        whitePlayerLabel?.text = playersName.white
        
        
        gameController?.gameEventDelegate = self
        
        boardView.setNeedsDisplay()
        boardView.chessDelegate = gameController
        gameController?.startGame()
    }
    
    /*
     * GameEventDelegate mathods implementation.
     */
    func onStart(board : Board){
        boardView.board = board
    }
    
    func onUpdate(){
        boardView.update()
    }
    
    func onCurrentPlayerChanged(currentPlayer : Player){
        boardView.currentPlayer = currentPlayer
    }
    
    func onFinish(){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: {
            action in
            let startViewController = self.storyboard?.instantiateViewController(withIdentifier: "StartGameViewController")
            self.present(startViewController!, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

