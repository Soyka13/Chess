//
//  Knight.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 03.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Knight: ChessPiece {
    override init(pieceColor: PieceColor!, location: (Int, Int)) {
        super.init(pieceColor: pieceColor, location: location)
    }
    
    override func isValidMove(startCell: (row: Int, col: Int), destinationCell: (row: Int, col: Int)) -> Bool {
        if (abs(destinationCell.row - startCell.row) == 1 && abs(destinationCell.col - startCell.col) == 2 ) || (abs(destinationCell.row - startCell.row) == 2 && abs(destinationCell.col - startCell.col) == 1 ){
            return true
        }
        return false
    }
}
