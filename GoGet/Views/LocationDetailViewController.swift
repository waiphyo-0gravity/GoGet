//
//  LocationDetailViewController.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var backBtnContainerView: UIView!
    @IBOutlet weak var backBtnActionBtn: AnimatedButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func handleBackClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - View lifecycle.
extension LocationDetailViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtnActionBtn.specificAnimateView = backBtnContainerView
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 44
    }
}

//MARK: - Table view datasource & delegates.
extension LocationDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 1 else { return nil }
        
        return LocationDetailHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return getHeaderTableViewCell(for: indexPath)
        case 1:
            return getDetailTableViewCell(for: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    private func getHeaderTableViewCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationDetailHeaderTableViewCell.CELL_IDENTIFIER, for: indexPath) as? LocationDetailHeaderTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    private func getDetailTableViewCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationDetailTableViewCell.CELL_IDENTIFIER, for: indexPath) as? LocationDetailTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
