//
//  ChessPiece.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

// A basic abstract class to represent a game figure
class ChessPiece {
    var pieceColor : PieceColor!
    var location : (row: Int, col: Int)
    
    init(pieceColor : PieceColor!, location: (Int, Int)) {
        self.pieceColor = pieceColor
        self.location = location
    }
    
    //    func isValidMove(startRow : Int, startCol : Int, destinationRow : Int, destinationCol : Int) -> Bool {
    //        return false
    //    }
    func isValidMove(startCell : (row: Int, col: Int), destinationCell : (row: Int, col: Int)) -> Bool {
        return false
    }
}


// MARK: - <Hashable>

extension ChessPiece: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}

// MARK: - <Equatable>

extension ChessPiece: Equatable {
    
    public static func ==(lhs: ChessPiece, rhs: ChessPiece) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
