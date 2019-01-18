//
//  MainCoordinator.swift
//  HackingWithSwift
//
//  Created by Faizan Naseem on 16/01/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    var children : [Coordinator] { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var children = [Coordinator]()
    
    init(navVC: UINavigationController) {
        self.navigationController = navVC
    }
    
    func start() {
        let vc = ViewController.instantiate(storyboard: .Main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetailVC(_ project: Project) {
        let detailVC = DetailViewController.instantiate(storyboard: .Main)
        detailVC.coordinator = self
        detailVC.project = project
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func showReadVC(_ project: Project) {
        let readVC = ReadViewController.instantiate(storyboard: .Main)
        readVC.project = project
        navigationController.pushViewController(readVC, animated: true)
    }
}

