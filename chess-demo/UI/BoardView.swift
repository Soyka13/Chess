//
//  BoardView.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import UIKit

class BoardView: UIView {
    var pieces = [[ChessPiece]]()
    var chessDelegate : ChessEventDelegate?
    var selectedCell = (row : -1, col: -1)
    var cellSize : CGFloat {
        get {
            self.frame.width / 8
        }
    }
    
    func update() {
        selectedCell = (-1, -1)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        drawBoard()
        drawPieces()
        drawSelectedCell()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first == nil {
            return
        }
        
        let (toRow, toCol) = getTouchedLocation(touch: touches.first!)
        let isCellTheSame = selectedCell == (toRow, toCol)
        
        if (pieces[toRow][toCol].location != (-1, -1)) {
            selectedCell = (isCellTheSame) ? (-1, -1) : (toRow, toCol)
            setNeedsDisplay()
        }
        
        if (!isCellTheSame) {
            chessDelegate?.onCellSelected(row: toRow, col: toCol)
        }
    }
    
    private func getTouchedLocation(touch: UITouch) -> (Int, Int) {
        let fingerLocation = touch.location(in: self)
        
        let row = Int(fingerLocation.x / cellSize)
        let col = Int(fingerLocation.y / cellSize)
        
        return (row, col)
    }
    
    /*
     * Methods for drawing game board.
     */
    
    func drawBoard() {
        drawTwoRowsAt(y: 0 * cellSize)
        drawTwoRowsAt(y: 2 * cellSize)
        drawTwoRowsAt(y: 4 * cellSize)
        drawTwoRowsAt(y: 6 * cellSize)
    }
    
    func drawPieces(){
        for i in 0..<pieces.count {
            for j in 0..<pieces.count {
                if pieces[i][j] is Blank {
                    continue
                }
                let pieceImage = UIImage(named: getIconResByChessPieceType(piece: pieces[i][j]))
                pieceImage?.draw(in: CGRect(x: CGFloat(pieces[i][j].location.row)*cellSize, y: CGFloat(pieces[i][j].location.col)*cellSize, width: cellSize, height: cellSize))
            }
        }
    }
    
    func drawSelectedCell() {
         if (selectedCell != (-1, -1)) {
             drawSquareWithStrokeAt(x: CGFloat(selectedCell.row)*cellSize, y: CGFloat(selectedCell.col)*cellSize)
         }
    }
    
    func drawTwoRowsAt(y: CGFloat) {
        drawSquareAt(x: 1*cellSize, y: y, color: .lightGray)
        drawSquareAt(x: 3*cellSize, y: y, color: .lightGray)
        drawSquareAt(x: 5*cellSize, y: y, color: .lightGray)
        drawSquareAt(x: 7*cellSize, y: y, color: .lightGray)
        
        drawSquareAt(x: 0*cellSize, y: y + cellSize, color: .lightGray)
        drawSquareAt(x: 2*cellSize, y: y + cellSize, color: .lightGray)
        drawSquareAt(x: 4*cellSize, y: y + cellSize, color: .lightGray)
        drawSquareAt(x: 6*cellSize, y: y + cellSize, color: .lightGray)
    }
    
    func drawSquareAt(x: CGFloat, y: CGFloat, color : UIColor) {
        let cellSize = self.frame.width / 8
        let rect = CGRect(x: x, y: y, width: cellSize, height: cellSize)
        let path = UIBezierPath(rect: rect)
        
        color.setFill()
        path.fill()
    }
    
    func drawSquareWithStrokeAt(x: CGFloat, y: CGFloat) {
        let rect = CGRect(x: x + 2, y: y + 2, width: cellSize - 4, height: cellSize - 4)
        
        let path = UIBezierPath(rect: rect)
        
        path.lineWidth = 3
        UIColor.green.setStroke()
        path.stroke()
    }
}
