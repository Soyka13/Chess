//
//  Player.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 17.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

class Player {
    var name : String
    var color : PieceColor
    
    
    init() {
        self.name = ""
        self.color = .Blank
    }
    
    init(name : String, color : PieceColor) {
        self.name = name
        self.color = color
    }
}
