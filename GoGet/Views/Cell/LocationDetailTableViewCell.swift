//
//  LocationDetailTableViewCell.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class LocationDetailTableViewCell: UITableViewCell, NibableCellProtocol {
    
    @IBOutlet weak var actionBtn: AnimatedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        actionBtn.specificAnimateView = self
    }
}
