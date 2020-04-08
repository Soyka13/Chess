//
//  ChessEventDelegate.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation


protocol ChessEventDelegate {
    func onChessPieceSelected(row : Int, col : Int)
    func movePiece(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int)
}
