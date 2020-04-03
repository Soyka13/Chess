//
//  BoardViewController.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import UIKit
class BoardViewController: UIViewController, ChessDelegate {
    
var chessEngine = ChessEngine()
@IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chessEngine.initializeGame()
        boardView.pieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        
        boardView.chessDelegate = self
    }
    
    func movePiece(fromX: Int, fromY: Int, toX: Int, toY: Int) {
//        chessEngine.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        chessEngine.movePiece(fromX: fromX, fromY: fromY, toX: toX, toY: toY)
        boardView.pieces = chessEngine.pieces
        boardView.setNeedsDisplay()
    }
}

