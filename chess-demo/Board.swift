//
//  Board.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 12.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Board {
    var pieces : [[ChessPiece]]
    
    init(pieces : [[ChessPiece]]) {
        self.pieces = pieces
    }
    
    func isPieceAtCell(row : Int, col : Int) -> Bool {
        if pieces[row][col].location.row == row && pieces[row][col].location.col == col{
            return true
        }
        return false
    }
    
    func movePiece(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) {
        pieces[fromRow][fromCol].location = (toRow, toCol)
        pieces[toRow][toCol] = pieces[fromRow][fromCol]
        
        pieces[fromRow][fromCol] = Blank()
        return
    }
    
    func printBoard(){
        for i in 0..<8 {
            for j in 0..<8 {
                print("At (\(i) , \(j)) - \(pieces[i][j])")
            }
        }
    }
    
}
