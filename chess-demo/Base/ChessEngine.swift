//
//  ChessEngine.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class ChessEngine {
    func generateStartBoard() -> Board {
        var pieces : [[ChessPiece]] = Array(repeating: Array(repeating: Blank(), count: 8), count: 8)
        
        pieces[0][0] = Rook(pieceColor: .Black, location: (0,0))
        pieces[7][0] = Rook(pieceColor: .Black, location: (7,0))
        pieces[0][7] = Rook(pieceColor: .White, location: (0,7))
        pieces[7][7] = Rook(pieceColor: .White, location: (7,7))
        
        pieces[1][0] = Knight(pieceColor: .Black, location: (1,0))
        pieces[6][0] = Knight(pieceColor: .Black, location: (6,0))
        pieces[1][7] = Knight(pieceColor: .White, location: (1,7))
        pieces[6][7] = Knight(pieceColor: .White, location: (6,7))
        
        pieces[2][0] = Bishop(pieceColor: .Black, location: (2,0))
        pieces[5][0] = Bishop(pieceColor: .Black, location: (5,0))
        pieces[2][7] = Bishop(pieceColor: .White, location: (2,7))
        pieces[5][7] = Bishop(pieceColor: .White, location: (5,7))
        
        pieces[3][0] = Queen(pieceColor: .Black, location: (3,0))
        pieces[3][7] = Queen(pieceColor: .White, location: (3,7))
        
        pieces[4][0] = King(pieceColor: .Black, location: (4,0))
        pieces[4][7] = King(pieceColor: .White, location: (4,7))
        
        for i in 0...7 {
            pieces[i][1] = Pawn(pieceColor: .Black, location: (i,1))
            pieces[i][6] = Pawn(pieceColor: .White, location: (i,6))
        }
        
        return Board(pieces: pieces)
    }
}
