//
//  ViewController.swift
//  Netflix
//
//  Created by user on 12/03/24.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let HomeImage = UIImage(systemName: "house")
        let upcomingImage = UIImage(systemName: "play.circle")
        let searchImage = UIImage(systemName: "magnifyingglass")
        let downloadImage = UIImage(systemName: "arrow.down.to.line")

        
        let homeVC = generateController(roolViewController: HomeViewController(),
                                        title: "Home", image: HomeImage!)
        let upcomingVC = generateController(roolViewController: UpcomingViewController(), 
                                            title: "Coming Soon", image: upcomingImage!)
        let searchVC = generateController(roolViewController: SearchViewController(),
                                          title: "Top Search", image: searchImage!)
        let downloadVC = generateController(roolViewController: DownloadViewController(),
                                            title: "DownLoads", image: downloadImage!)
        
        setViewControllers([homeVC, upcomingVC, searchVC, downloadVC], animated: true)
        tabBar.tintColor = .label
    }

    func generateController(roolViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let vc = UINavigationController(rootViewController: roolViewController)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }

}
