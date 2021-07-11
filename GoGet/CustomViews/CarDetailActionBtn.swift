//
//  CarDetailActionBtn.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class CarDetailActionBtn: AnimatedButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "C300")?.cgColor
    }
}
