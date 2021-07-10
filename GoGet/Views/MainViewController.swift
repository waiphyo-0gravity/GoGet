//
//  MainViewController.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var bottomFloatView: UIView!
    @IBOutlet weak var notificationBtn: AnimatedButton!
    @IBOutlet weak var locationBtn: AnimatedButton!
    @IBOutlet weak var bottomFloatCornerRadiusView: UIView!
    
    
    @IBAction func handleLocationBtnClick(_ sender: Any) {
        let locationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "locationdetailvc")
        tabBarController?.navigationController?.pushViewController(locationVC, animated: true)
    }
}

//MARK: - View lifecycle.
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        locationBtn.layer.cornerRadius = 56 / 2
        locationBtn.addAccentShadow()
        
        notificationBtn.layer.cornerRadius = 56 / 2
        notificationBtn.addAccentShadow()
        
        bottomFloatView.addAccentShadow()
        bottomFloatCornerRadiusView.layer.cornerRadius = 12
        bottomFloatCornerRadiusView.clipsToBounds = true
    }
}

class MainNavViewcontroller: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: false)
    }
}

class MainTabBarViewController: UITabBarController {
    let tabImages = [
        (normal: UIImage(systemName: "bookmark"), selected: UIImage(systemName: "bookmark.fill"), title: "Bookings"),
        (normal: UIImage(systemName: "gift"), selected: UIImage(systemName: "gift.fill"), title: "Refer a friend"),
        (normal: UIImage(systemName: "person.circle"), selected: UIImage(systemName: "person.circle.fill"), title: "Account")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabImages.forEach { data in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainvc")
            vc.tabBarItem.image = data.normal
            vc.tabBarItem.selectedImage = data.selected
            vc.tabBarItem.title = data.title
            viewControllers?.append(vc)
        }
    }
}
