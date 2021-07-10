//
//  LaunchHelper.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class LaunchHelper {
    static func handleAppStarting(with window: UIWindow?) {
        let barAppearance = UINavigationBar.appearance(whenContainedInInstancesOf: [MainNavViewcontroller.self])
        
        barAppearance.setBackgroundImage(UIImage(), for: .default)
        barAppearance.barTintColor = .white
        barAppearance.shadowImage = UIImage()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
        UITabBar.appearance().barTintColor = UIColor(named: "Primary")
        UITabBar.appearance().tintColor = UIColor.white
    }

}
