//
//  CarDetailCostTableViewCell.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class CarDetailCostTableViewCell: UITableViewCell, NibableCellProtocol {

    @IBOutlet weak var actionBtn: AnimatedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        actionBtn.specificAnimateView = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
