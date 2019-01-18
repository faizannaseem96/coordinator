//
//  ReadViewController.swift
//  HackingWithSwift
//
//  Created by Paul Hudson on 08/11/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit
import WebKit

class ReadViewController: UIViewController, Storyboarded {
    var webView = WKWebView()
    var project: Project!
    var navigationDelegate = NavigationDelagate()
    
    override func loadView() {
        webView.navigationDelegate = navigationDelegate
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(project != nil, "You must set a project before show this view controller.")
        title = project.title

        guard let url = URL(string: "https://www.hackingwithswift.com/read/\(project.number)/overview") else {
            return
        }

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
