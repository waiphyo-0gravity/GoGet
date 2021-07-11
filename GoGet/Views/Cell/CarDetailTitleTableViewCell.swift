//
//  CarDetailTitleTableViewCell.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class CarDetailTitleTableViewCell: UITableViewCell, NibableCellProtocol {

    @IBOutlet weak var confirmedContainerView: UIView!
    @IBOutlet weak var durationContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confirmedContainerView.layer.cornerRadius = 4
        durationContainerView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
