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
    
    override func isValidMove(startCell : (row: Int, col: Int), destinationCell : (row: Int, col: Int)) -> Bool {
        if (self.pieceColor == PieceColor.White){
            if (movedTwice == false){
                if ((destinationCell.col - startCell.col) == -2 && destinationCell.row == startCell.row){
                    self.movedTwice = true
                    return true
                }
                if ((destinationCell.col - startCell.col) == -1 && destinationCell.row == startCell.row) {
                    self.movedTwice = true
                    return true
                }
                
            } else {
                if ((destinationCell.col - startCell.col) == -1 && destinationCell.row == startCell.row) {
                    return true
                }
            }
        }
        if (self.pieceColor == PieceColor.Black) {
            if (movedTwice == false){
                if ((destinationCell.col - startCell.col) == 2 && destinationCell.row == startCell.row){
                    self.movedTwice = true
                    return true
                }
                if ((destinationCell.col - startCell.col) == 1 && destinationCell.row == startCell.row) {
                    self.movedTwice = true
                    return true
                }
                
            } else {
                if ((destinationCell.col - startCell.col) == 1 && destinationCell.row == startCell.row) {
                    return true
                }
            }
        }
        
        
        return false
    }
    
    override func isValidBeating(_ destinationCell: (row : Int, col : Int)) -> Bool {
        return (abs(destinationCell.row - location.row) == 1 && abs(destinationCell.col - location.col) == 1)
    }
}
