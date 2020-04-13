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
    
    let gameController = GameController()
    var chessEngine = ChessEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameController.gameEventDelegate = self
   
        boardView.setNeedsDisplay()
        boardView.chessDelegate = gameController
        gameController.startGame()
    }
    
    /*
     * GameEventDelegate mathods implementation.
     */
    func onStart(pieces : [[ChessPiece]]){
        boardView.pieces = pieces
    }
    
    func onUpdate(){
        boardView.setNeedsDisplay()
    }
    
    func onFinish(){
        
    }
}

