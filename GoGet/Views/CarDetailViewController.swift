//
//  CarDetailViewController.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class CarDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backActionBtn: AnimatedButton!
    @IBOutlet weak var backContainerView: UIView!
    
    @IBAction func handleBackAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTappedCell(_ sender: UIButton) {
        guard sender.tag == 5 else { return }
        
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - View lifecycle.
extension CarDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .clear
        
        backActionBtn.specificAnimateView = backContainerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
}

//MARK: - Table view datasources & delegates.
extension CarDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return getTitleCell(for: indexPath)
        case 1:
            return getCarImgCell(for: indexPath)
        case 2:
            return getMapCell(for: indexPath)
        case 3:
            return getCostCell(for: indexPath)
        case 4:
            return getActionCell(for: indexPath)
        case 5:
            return getActionCell(for: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    private func getTitleCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailTitleTableViewCell.CELL_IDENTIFIER, for: indexPath) as? CarDetailTitleTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    private func getCarImgCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailCarImgTableViewCell.CELL_IDENTIFIER, for: indexPath) as? CarDetailCarImgTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    private func getMapCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailMapTableViewCell.CELL_IDENTIFIER, for: indexPath) as? CarDetailMapTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    private func getCostCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailCostTableViewCell.CELL_IDENTIFIER, for: indexPath) as? CarDetailCostTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    private func getActionCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailActionTableViewCell.CELL_IDENTIFIER, for: indexPath) as? CarDetailActionTableViewCell else {
            return UITableViewCell()
        }
        
        let isHelpCell = indexPath.row == 4
        
        cell.actionBtn.tag = indexPath.row
        cell.imgView.image = UIImage(named: isHelpCell ? "help_icon" : "help_cancel_icon")
        cell.nameLbl.text = isHelpCell ? "Need help?" : "Cancel this booking"
        cell.actionBtn.addTarget(self, action: #selector(handleTappedCell(_:)), for: .touchUpInside)
        
        return cell
    }
}

class CardCornerRadiusImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
    }
}
