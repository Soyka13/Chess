//
//  Bishop.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 03.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Bishop: ChessPiece {
    override init(pieceColor: PieceColor!, location: (Int, Int)) {
        super.init(pieceColor: pieceColor, location: location)
    }
    
    override func isValidMove(startRow: Int, startCol: Int, destinationRow: Int, destinationCol: Int, isBeating: Bool) -> Bool {
        if(abs(destinationRow - startRow) == abs(destinationCol - startCol)) {
            return true
        }
        return false
    }
}
