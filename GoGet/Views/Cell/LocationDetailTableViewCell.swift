//
//  LocationDetailTableViewCell.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class LocationDetailTableViewCell: UITableViewCell, NibableCellProtocol {
    
    @IBOutlet weak var actionBtn: AnimatedButton!
    @IBOutlet weak var distanceViewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        actionBtn.specificAnimateView = self
        distanceViewContainer.layer.cornerRadius = 4
        distanceViewContainer.layer.borderWidth = 1
        distanceViewContainer.layer.borderColor = UIColor(named: "Secondary")?.withAlphaComponent(0.3).cgColor
    }
}
