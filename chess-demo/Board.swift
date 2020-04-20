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
    
    func pieceAt(cell : ((row : Int, col : Int))) -> ChessPiece {
        return pieces[cell.row][cell.col]
    }
    
    func movePiece(fromCell: (row: Int, col: Int), toCell: (row: Int, col: Int)) {
        pieces[fromCell.row][fromCell.col].location = (toCell.row, toCell.col)
        pieces[toCell.row][toCell.col] = pieces[fromCell.row][fromCell.col]
        
        pieces[fromCell.row][fromCell.col] = Blank()
    }

    func removePiece(_ selectedCell : (row : Int, col : Int), _ beatedCell : (row : Int, col : Int)) {
        movePiece(fromCell: selectedCell, toCell: beatedCell)
    }
    
    func printBoard(){
        for i in 0..<8 {
            for j in 0..<8 {
                print("At (\(i) , \(j)) - \(pieces[i][j])")
            }
        }
    }
    
}
