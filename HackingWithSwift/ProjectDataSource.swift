//
//  ProjectDataSource.swift
//  HackingWithSwift
//
//  Created by Faizan Naseem on 16/01/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class ProjectDataSource: NSObject, UITableViewDataSource {
    
    let projects = Bundle.main.decode([Project].self, filename: "projects.json")

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel?.attributedText = project.makeAttributedString(title: project.title, subtitle: project.subtitle)
        return cell
    }
    
    func projectAt(index: Int) -> Project {
        return projects[index]
    }
}
