//
//  Resources.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 11.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

func getIconResByChessPieceType(piece : ChessPiece) -> String {
    switch piece {
        case is Rook:
            return piece.pieceColor == PieceColor.White ? "WhiteRook" : "BlackRook"
        case is Pawn:
            return piece.pieceColor == PieceColor.White ? "WhitePawn" : "BlackPawn"
        case is Knight:
            return piece.pieceColor == PieceColor.White ? "WhiteKnight" : "BlackKnight"
        case is Bishop:
            return piece.pieceColor == PieceColor.White ? "WhiteBishop" : "BlackBishop"
        case is Queen:
            return piece.pieceColor == PieceColor.White ? "WhiteQueen" : "BlackQueen"
        case is King:
            return piece.pieceColor == PieceColor.White ? "WhiteKing" : "BlackKing"
        case is Blank:
            return ""
        default:
            return ""
    }
}
