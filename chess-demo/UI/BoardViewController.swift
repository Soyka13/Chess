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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gameController = GameController()
        
        gameController.gameEventDelegate = self
//        boardView.pieces = chessEngine.piecess
        boardView.setNeedsDisplay()
        
        boardView.chessDelegate = gameController
    }
    
//
//    func movePiece(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) {
//        chessEngine.movePiece(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol)
//        boardView.pieces = chessEngine.pieces
//        boardView.setNeedsDisplay()
//    }
    
    func onStart(pieces : Set<ChessPiece>){
        boardView.pieces = pieces
    }
    func onUpdate(){
        
    }
    func onFinish(){
        
    }
}

