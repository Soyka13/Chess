//
//  GameController.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 07.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation


class GameController : ChessEventDelegate {

    var gameEventDelegate : GameEventDelegate?
    
    private var selectedCell = (row: -1, col: -1)
    private var chessEngine = ChessEngine()
    private var board : Board?
    
    private var currentPlayer : Player?
    private var whitePlayer : Player
    private var blackPlayer : Player
    
    init(_ whitePlayerName: String, _ blackPlayerName: String) {
        whitePlayer = Player(name: whitePlayerName, color: .White)
        blackPlayer = Player(name: blackPlayerName, color: .Black)
    }
    
    func startGame(){
        currentPlayer = whitePlayer
        gameEventDelegate?.onCurrentPlayerChanged(currentPlayer: currentPlayer!)
        
        board = self.chessEngine.generateStartBoard()
        if let notNilBoard = board {
            gameEventDelegate?.onStart(board : notNilBoard)
        }
    }

    func onPieceSelected(_ selectedCell: (Int, Int)) {
       self.selectedCell = selectedCell
    }

    func onPieceMoved(_ destinationCell: (Int, Int)) {
        if board == nil {
            return
        }

        let piece = board!.pieceAt(cell: selectedCell)

        if piece.isValidMove(startCell: selectedCell, destinationCell: destinationCell) && board!.isPathClear(selectedCell, destinationCell){
            board!.movePiece(fromCell: selectedCell, toCell: destinationCell)
            gameEventDelegate?.onUpdate()
            changePlayer()
        }
    }

    func onPieceBeat(_ beatedCell: (Int, Int)) {
        if board == nil {
            return
        }

        let piece = board!.pieceAt(cell: selectedCell)

        if piece.isValidBeating(beatedCell) && board!.isPathClear(selectedCell, beatedCell){
            board!.removePiece(selectedCell, beatedCell)
            gameEventDelegate?.onUpdate()
            changePlayer()
        }
    }

    private func changePlayer() {
        currentPlayer = currentPlayer === whitePlayer ? blackPlayer : whitePlayer
        gameEventDelegate?.onCurrentPlayerChanged(currentPlayer: currentPlayer!)
    }
}
