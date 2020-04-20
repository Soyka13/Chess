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
        
    }
}

