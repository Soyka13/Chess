//
//  Board.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 12.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Board {
    var pieces : [[ChessPiece]]
    
    init(pieces : [[ChessPiece]]) {
        self.pieces = pieces
    }
    
    func isPieceAtCell(row : Int, col : Int) -> Bool {
        if pieces[row][col].location.row == row && pieces[row][col].location.col == col{
            return true
        }
        return false
    }
    
    func pieceAt(cell : ((row : Int, col : Int))) -> ChessPiece {
        return pieces[cell.row][cell.col]
    }
    
    func movePiece(fromCell: (row: Int, col: Int), toCell: (row: Int, col: Int)) {
        pieces[fromCell.row][fromCell.col].location = (toCell.row, toCell.col)
        pieces[toCell.row][toCell.col] = pieces[fromCell.row][fromCell.col]
        
        pieces[fromCell.row][fromCell.col] = Blank()
    }
    
    func removePiece(_ selectedCell : (row : Int, col : Int), _ beatedCell : (row : Int, col : Int)) {
        movePiece(fromCell: selectedCell, toCell: beatedCell)
    }
    
    func isOnBoard(_ row: Int, _ col: Int) -> Bool {
        if row > 7 || row < 0 || col > 7 || col < 0 {
            return false
        }
        return true
    }
    
    func isPathClear(_ startCell: (row: Int, col: Int), _ destinationCell: (row : Int, col : Int)) -> Bool {
        if self.pieces[startCell.row][startCell.col] is Knight {
            return true
        }
        
        let direction = getDirection(startCell, destinationCell)
        
        switch direction {
        case .Vertical:
            let movingUp = (destinationCell.col - startCell.col) > 0 ? true : false
            let movementCount = movingUp ? 1 : -1
//            print(movementCount)
            for i in stride(from: startCell.col+movementCount, to: destinationCell.col, by: movementCount) {
                print(self.pieces[startCell.row][i])
                if !(self.pieces[startCell.row][i] is Blank){
//                    print("Not blank1")
                    return false
                }
            }
            break
        case .Horizontal:
            let movingRight = (destinationCell.row - startCell.row) > 0 ? true : false
            let movementCount = movingRight ? 1 : -1
            
            for i in stride(from: startCell.row + movementCount, to: destinationCell.row, by: movementCount) {
                if !(self.pieces[i][startCell.col] is Blank){
                    print("Not blank2")
                    return false
                }
            }
            break
        case .Diagonal:
            let movingUp = (destinationCell.col - startCell.col) > 0 ? true : false
            let movingRight = (destinationCell.row - startCell.row) > 0 ? true : false

            let count = abs(destinationCell.row - startCell.row)
            let movementCount = (rowCount : movingRight ? 1 : -1, colCount : movingUp ? 1 : -1)
         
            for i in 1..<count {
                if !(self.pieces[startCell.row + movementCount.rowCount * i][startCell.col + movementCount.colCount * i] is Blank){
                    return false
                }
            }
            break
        }
        
        return true
    }
    
    private func getDirection(_ startCell: (row: Int, col: Int), _ destinationCell: (row : Int, col : Int)) -> Direction {
        if abs(startCell.row - destinationCell.row) == abs(startCell.col - destinationCell.col) {
            return .Diagonal
        } else if startCell.col == destinationCell.col {
            return .Horizontal
        } else {
            return .Vertical
        }
    }
    
    func printBoard(){
        for i in 0..<8 {
            for j in 0..<8 {
                print("At (\(i) , \(j)) - \(pieces[i][j])")
            }
        }
    }
    
}
