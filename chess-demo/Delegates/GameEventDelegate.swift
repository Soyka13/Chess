//
//  GameEventDelegate.swift
//  chess-demo
//
//  Created by Helen Stepaniuk on 08.04.2020.
//  Copyright © 2020 Helen Stepaniuk. All rights reserved.
//

import Foundation

protocol GameEventDelegate {
    func onStart(board : Board)
    func onUpdate()
    func onFinish()
}
