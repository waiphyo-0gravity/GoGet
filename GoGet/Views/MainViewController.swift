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
        animateViews(isAnimate: true, isShow: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(400)) {[unowned self] in
            let locationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "locationdetailvc")
            self.tabBarController?.navigationController?.pushViewController(locationVC, animated: true)
        }
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
        
        animateViews(isAnimate: false, isShow: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateViews(isShow: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}

//MARK: - Animations.
extension MainViewController {
    private func animateViews(isAnimate: Bool = true, isShow: Bool, completion: ((Bool)->Void)? = nil) {
        UIView.easeSpringAnimation(isAnimate: isAnimate, delay: isShow ? 0.3 : 0.3) {[unowned self] in
            self.bottomFloatView.alpha = isShow ? 1 : 0
            self.bottomFloatView.transform = isShow ? .identity : CGAffineTransform(translationX: 0, y: self.bottomFloatView.frame.height)
        }
        
        UIView.easeSpringAnimation(isAnimate: isAnimate, withDuration: 1,  delay: isShow ? 0.6 : 0.2, usingSpringWithDamping: 0.6, animations: {[unowned self] in
            self.locationBtn.alpha = isShow ? 1 : 0
            self.locationBtn.transform = isShow ? .identity : CGAffineTransform(translationX: 40, y: 0)
        }, completion: completion)
        
        UIView.easeSpringAnimation(isAnimate: isAnimate, withDuration: 1,  delay: isShow ? 0.8 : 0, usingSpringWithDamping: 0.6) {[unowned self] in
            self.notificationBtn.alpha = isShow ? 1 : 0
            self.notificationBtn.transform = isShow ? .identity : CGAffineTransform(translationX: 40, y: 0)
        }
    }
}


//MARK: - Main parent views.
class MainNavViewcontroller: UINavigationController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
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
