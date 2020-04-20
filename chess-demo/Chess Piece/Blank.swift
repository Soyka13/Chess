//
//  Blank.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 07.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Blank: ChessPiece {
    init() {
        super.init(pieceColor: .Blank, location: (-1, -1))
    }

    init(_ location : (row : Int, col : Int)) {
        super.init(pieceColor: .Blank, location: location)
    }
}
