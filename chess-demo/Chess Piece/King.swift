//
//  King.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 03.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class King: ChessPiece {
    var isInСastle = false
    
    override init(pieceColor: PieceColor!, location: (Int, Int)) {
        super.init(pieceColor: pieceColor, location: location)
    }
    
    override func isValidMove(startCell: (row: Int, col: Int), destinationCell: (row: Int, col: Int)) -> Bool {
        if(abs(destinationCell.row - startCell.row) <= 1 && abs(destinationCell.col - startCell.col) <= 1){
            return true
        }
        return false
    }
    
    func isInCheck(board : Board) -> Bool {
        for i in 0..<8 {
            for j in 0..<8 {
                let validBeat = board.pieces[i][j].isValidBeating(self.location)
                if !(board.pieces[i][j] is Blank) && board.pieces[i][j].pieceColor != self.pieceColor && validBeat {
                    return true
                }
            }
        }
        return false
    }
}
