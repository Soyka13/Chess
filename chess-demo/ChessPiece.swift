//
//  ChessPiece.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation


enum PieceColor {
    case White
    case Black
}

// A basic abstract class to represent a game figure
class ChessPiece {

    var pieceImage : String
    var pieceColor : PieceColor!
    var location : (x: Int, y: Int)
    
    
    init(pieceImage : String, pieceColor : PieceColor!, location: (Int, Int)) {
        self.pieceImage = pieceImage
        self.pieceColor = pieceColor
        self.location = location
    }
  
    func isValidMove(startX : Int, startY : Int, destinationX : Int, destinstionY : Int) -> Bool {
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
