//
//  Rook.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 03.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Rook: ChessPiece {
    var engine = ChessEngine()
    
    override func setNextMoves() {
        let row = self.location.row
        let col = self.location.col
        
        for i in row+1..<8 {
            if (engine.pieceAt(row: i, col: col) == nil) {
                nextMoves.append((i,col))
            }
        }
        for i in col+1..<8 {
            if (engine.pieceAt(row: row, col: i) == nil) {
                nextMoves.append((i,col))
            }
        }
    }
}
