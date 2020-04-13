//
//  Pawn.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 03.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Pawn: ChessPiece {
    var movedTwice = false
    
    override init(pieceColor: PieceColor!, location: (Int, Int)) {
          super.init(pieceColor: pieceColor, location: location)
      }
    
    override func isValidMove(startRow: Int, startCol: Int, destinationRow: Int, destinationCol: Int, isBeating : Bool) -> Bool {
        if (!isBeating) {
            if (!movedTwice){
                if (abs(destinationCol - startCol) == 1 && destinationRow == startRow) {
                    return true
                }
                
                if (abs(destinationCol - startCol) == 2 && destinationRow == startCol){
                    movedTwice = true
                    return true
                }
            } else {
                if (abs(destinationRow - startRow) == 1 && destinationCol == startCol) {
                    return true
                }
            }
        } else {
            if (abs(destinationRow - startRow) == 1 && abs(destinationCol - startCol) == 1){
                return true
            }
        }
        return false
    }
}
