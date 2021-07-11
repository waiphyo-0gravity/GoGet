//
//  LocationDetailHeaderView.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class LocationDetailHeaderView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mapActionBtn: AnimatedButton!
    @IBOutlet weak var filterActionBtn: AnimatedButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addViews()
    }
}

//MARK: - Private functions.
extension LocationDetailHeaderView {
    private func addViews() {
        Bundle.main.loadNibNamed("LocationDetailHeaderView", owner: self, options: nil)
        backgroundColor = UIColor(named: "Primary")
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        mapActionBtn.layer.cornerRadius = 4
        filterActionBtn.layer.cornerRadius = 4
    }
}
