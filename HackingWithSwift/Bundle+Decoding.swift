//
//  Bundle+Decoding.swift
//  HackingWithSwift
//
//  Created by Faizan Naseem on 16/01/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, filename: String ) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Failed to locate projects.json in app bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load projects.json in app bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedProjects = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode projects.json from app bundle.")
        }
        return loadedProjects
    }
}
