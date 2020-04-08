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
    var pieceImage : String
    var pieceColor : PieceColor!
    var location : (row: Int, col: Int)
    var nextMoves = [(row: Int, col: Int)]()
    var type : PieceType
    
    init(pieceImage : String, pieceColor : PieceColor!, location: (Int, Int), type : PieceType) {
        self.pieceImage = pieceImage
        self.pieceColor = pieceColor
        self.location = location
        self.type = type
    }
    
    func isValidMove(startRow : Int, startCol : Int, destinationRow : Int, destinstionCol : Int) -> Bool {
        return false
    }
    
    func setNextMoves(){
        return
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
