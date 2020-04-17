//
//  GameController.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 07.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation


class GameController : ChessEventDelegate {
    var selectedCell = (row: -1, col: -1)
    var chessEngine = ChessEngine()
    var gameEventDelegate : GameEventDelegate? 
    var board : Board?
    
    func startGame(){
        board = self.chessEngine.generateStartBoard()
        if let notNilBoard = board {
            gameEventDelegate?.onStart(board : notNilBoard)
        }
    }
    
    func onCellSelected(row : Int, col : Int) {
        //check if incoming cell is equal to previous cell
        if selectedCell == (row, col) {
            selectedCell = (-1, -1)
            return
        }
        //check if the piece have current player color
        if board?.pieces[row][col].pieceColor == PieceColor.White || selectedCell == (-1, -1){
            selectedCell = (row, col)
        } else {
            if let notNilBoard = board {
                if notNilBoard.pieces[selectedCell.row][selectedCell.col].isValidMove(startCell: selectedCell, destinationCell: (row, col)) {
                    notNilBoard.movePiece(fromRow: selectedCell.row, fromCol: selectedCell.col, toRow: row, toCol: col)
                    gameEventDelegate?.onUpdate()
                    selectedCell = (-1, -1)
                }
            }
        }
    }
}
