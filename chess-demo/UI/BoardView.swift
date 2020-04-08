//
//  BoardView.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import UIKit

class BoardView: UIView {
    var pieces = Set<ChessPiece>()
    var chessDelegate : ChessEventDelegate?
    var fromRow = -1
    var fromCol = -1
    
    
    
    override func draw(_ rect: CGRect) {
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let cellSize = self.frame.width / 8
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        fromRow = Int(fingerLocation.x / cellSize)
        fromCol = Int(fingerLocation.y / cellSize)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let cellSize = self.frame.width / 8
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        let toRow = Int(fingerLocation.x / cellSize)
        let toCol = Int(fingerLocation.y / cellSize)
        chessDelegate?.movePiece(fromRow: fromRow, fromCol: fromCol, toRow: toRow, toCol: toCol)
    }
    
    func drawPieces(){
        let cellSize : Double = Double(self.frame.width / 8)
        for piece in pieces {
            let pieceImage = UIImage(named: piece.pieceImage)
            pieceImage?.draw(in: CGRect(x: Double(piece.location.row)*cellSize, y: Double(piece.location.col)*cellSize, width: cellSize, height: cellSize))
        }
    }
    
    func drawBoard() {
        let cellSize = self.frame.width / 8
        drawTwoRowsAt(y: 0 * cellSize)
        drawTwoRowsAt(y: 2 * cellSize)
        drawTwoRowsAt(y: 4 * cellSize)
        drawTwoRowsAt(y: 6 * cellSize)
    }
    
    func drawTwoRowsAt(y: CGFloat) {
        let cellSize = self.frame.width / 8
        drawSquareAt(x: 1*cellSize, y: y)
        drawSquareAt(x: 3*cellSize, y: y)
        drawSquareAt(x: 5*cellSize, y: y)
        drawSquareAt(x: 7*cellSize, y: y)
        
        drawSquareAt(x: 0*cellSize, y: y + cellSize)
        drawSquareAt(x: 2*cellSize, y: y + cellSize)
        drawSquareAt(x: 4*cellSize, y: y + cellSize)
        drawSquareAt(x: 6*cellSize, y: y + cellSize)
    }
    
    func drawSquareAt(x: CGFloat, y: CGFloat) {
        let cellSize = self.frame.width / 8
        let path = UIBezierPath(rect: CGRect(x: x, y: y, width: cellSize, height: cellSize))
        UIColor.lightGray.setFill()
        path.fill()
    }
}
