//
//  NibableHelperProtocol.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

//  MARK: - Nibable protocol.
protocol NibableProtocol {
    
}

extension NibableProtocol {
    static func createNib() -> UINib {
        let className = String(describing: Self.self)
        return UINib(nibName: className, bundle: nil)
    }
}

//  MARK: - Nibable Table cell protocol.
protocol NibableCellProtocol: NibableProtocol {
    
}

extension NibableCellProtocol {
    static var CELL_IDENTIFIER: String {
        return String(describing: Self.self)
    }
}

