//
//  ChessDelegate.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 04.01.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation


protocol ChessDelegate {
    func movePiece(fromX: Int, fromY: Int, toX: Int, toY: Int) 
}
