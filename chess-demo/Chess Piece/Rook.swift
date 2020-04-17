//
//  Rook.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 03.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Rook: ChessPiece {
    override init(pieceColor: PieceColor!, location: (Int, Int)) {
        super.init(pieceColor: pieceColor, location: location)
    }
    
    //    override func isValidMove(startRow: Int, startCol: Int, destinationRow: Int, destinationCol: Int) -> Bool {
    //        if(destinationRow == startRow || destinationCol == startRow){
    //            return true
    //        }
    //        return false
    //    }
    
    override func isValidMove(startCell: (row: Int, col: Int), destinationCell: (row: Int, col: Int)) -> Bool {
        if(destinationCell.row == startCell.row || destinationCell.col == startCell.col){
            return true
        }
        return false
    }
}
