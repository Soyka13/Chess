//
//  ChessEngine.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class ChessEngine {
    var pieces = Set<ChessPiece>()
    
    func pieceAt(x: Int, y: Int) -> ChessPiece? {
        for piece in pieces {
            if piece.location.x == x && piece.location.y == y {
                return piece
            }
        }
        return nil
    }
    
    func movePiece(fromX: Int, fromY: Int, toX: Int, toY: Int){
        guard let movingPiece = pieceAt(x: fromX, y: fromY)
            else {
                return
        }
        
        pieces.remove(movingPiece)
        pieces.insert(ChessPiece(pieceImage: movingPiece.pieceImage, pieceColor: movingPiece.pieceColor, location: (toX, toY)))
    }
    
    func initializeGame() {
        pieces.removeAll()
        
        let blackPawn = "black_pawn"
        let whitePawn = "white_pawn"
        let blackRook = "black_rook"
        let whiteRook = "white_rook"
        let blackKnight = "black_knight"
        let whiteKnight = "white_knight"
        let blackBishop = "black_bishop"
        let whiteBishop = "white_bishop"
        let blackQueen = "black_queen"
        let whiteQueen = "white_queen"
        let blackKing = "black_king"
        let whiteKing = "white_king"
        
        pieces.insert(ChessPiece(pieceImage: blackRook, pieceColor: .Black, location: (0,0)))
        pieces.insert(ChessPiece(pieceImage: blackRook, pieceColor: .Black, location: (7,0)))
        pieces.insert(ChessPiece(pieceImage: whiteRook, pieceColor: .White, location: (0,7)))
        pieces.insert(ChessPiece(pieceImage: whiteRook, pieceColor: .White, location: (7,7)))
        
        pieces.insert(ChessPiece(pieceImage: blackKnight, pieceColor: .Black, location: (1,0)))
        pieces.insert(ChessPiece(pieceImage: blackKnight, pieceColor: .Black, location: (6,0)))
        pieces.insert(ChessPiece(pieceImage: whiteKnight, pieceColor: .White, location: (1,7)))
        pieces.insert(ChessPiece(pieceImage: whiteKnight, pieceColor: .White, location: (6,7)))
        
        pieces.insert(ChessPiece(pieceImage: blackBishop, pieceColor: .Black, location: (2,0)))
        pieces.insert(ChessPiece(pieceImage: blackBishop, pieceColor: .Black, location: (5,0)))
        pieces.insert(ChessPiece(pieceImage: whiteBishop, pieceColor: .White, location: (2,7)))
        pieces.insert(ChessPiece(pieceImage: whiteBishop, pieceColor: .White, location: (5,7)))
        
        pieces.insert(ChessPiece(pieceImage: blackQueen, pieceColor: .Black, location: (3,0)))
        pieces.insert(ChessPiece(pieceImage: whiteQueen, pieceColor: .White, location: (3,7)))
        
        pieces.insert(ChessPiece(pieceImage: blackKing, pieceColor: .Black, location: (4,0)))
        pieces.insert(ChessPiece(pieceImage: whiteKing, pieceColor: .White, location: (4,7)))
        
        
        for i in 0...7 {
            pieces.insert(ChessPiece(pieceImage: blackPawn, pieceColor: .Black, location: (i,1)))
            pieces.insert(ChessPiece(pieceImage: whitePawn, pieceColor: .White, location: (i,6)))
        }
        
    }
}
