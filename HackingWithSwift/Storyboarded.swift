//
//  Storyboarded.swift
//  HackingWithSwift
//
//  Created by Faizan Naseem on 16/01/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardName : String {
    case Main, SetupProfile, HowItWorks, Home, MealsToOrder, TrackOrder
}

protocol Storyboarded {
    static func instantiate(storyboard: StoryboardName) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard: StoryboardName) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
