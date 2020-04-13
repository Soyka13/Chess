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
    var board : Board?
    
    func startGame(){
        board = self.chessEngine.generateStartBoard()
        if let notNilBoard = board {
            gameEventDelegate?.onStart(pieces: notNilBoard.pieces)
        }
    }
    
    func onCellSelected(row : Int, col : Int){
        
    }    
}
