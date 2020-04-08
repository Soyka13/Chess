//
//  GameController.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 07.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation


class GameController : ChessEventDelegate {
    var selectedChessPiece : ChessPiece?
    
    var chessEngine = ChessEngine()
    
    var gameEventDelegate : GameEventDelegate?
    
    func onChessPieceSelected(row : Int, col : Int){
        
    }
    
    func movePiece(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) {
        
    }
}
