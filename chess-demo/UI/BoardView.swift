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
    var chessDelegate : ChessDelegate?
    var fromX = -1
    var fromY = -1
    
    override func draw(_ rect: CGRect) {
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        fromX = Int(fingerLocation.x / 50)
        fromY = Int(fingerLocation.y / 50)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        let toX = Int(fingerLocation.x / 50)
        let toY = Int(fingerLocation.y / 50)
        chessDelegate?.movePiece(fromX: fromX, fromY: fromY, toX: toX, toY: toY)
    }
    
    func drawPieces(){
        for piece in pieces {
            let pieceImage = UIImage(named: piece.pieceImage)
            pieceImage?.draw(in: CGRect(x: piece.location.x*50, y: piece.location.y*50, width: 50, height: 50))
        }
    }
    
    
    func drawBoard() {
        drawTwoRowsAt(y: 0 * 50)
        drawTwoRowsAt(y: 2 * 50)
        drawTwoRowsAt(y: 4 * 50)
        drawTwoRowsAt(y: 6 * 50)
    }
    
    func drawTwoRowsAt(y: CGFloat) {
        drawSquareAt(x: 1*50, y: y)
        drawSquareAt(x: 3*50, y: y)
        drawSquareAt(x: 5*50, y: y)
        drawSquareAt(x: 7*50, y: y)
        
        drawSquareAt(x: 0*50, y: y + 50)
        drawSquareAt(x: 2*50, y: y + 50)
        drawSquareAt(x: 4*50, y: y + 50)
        drawSquareAt(x: 6*50, y: y + 50)
    }
    
    func drawSquareAt(x: CGFloat, y: CGFloat) {
        let path = UIBezierPath(rect: CGRect(x: x, y: y, width: 50, height: 50))
        UIColor.lightGray.setFill()
        path.fill()
    }
}
