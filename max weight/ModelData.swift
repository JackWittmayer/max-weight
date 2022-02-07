//
//  ModelData.swift
//  max weight
//
//  Created by Jack Wittmayer on 11/11/21.
//

import Foundation

var exercises: [Exercise] = load("exerciseData.json")
// Turn exercises into 
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    let url = getDocumentsDirectory().appendingPathComponent("exercises.json")
    let path = url.path
    let fileManager = FileManager.default
    var file = url
    if !fileManager.fileExists(atPath: path)
    {
        guard let file2 = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        file = file2
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

