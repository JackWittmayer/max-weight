//
//  Helper.swift
//  max weight
//
//  Created by Jack Wittmayer on 11/11/21.
//

import Foundation

func roundToNearest5(number: Int) -> Int
{
    let remainder = number % 5
    if remainder <= 2
    {
        return number - remainder
    }
    else if remainder >= 3
    {
        return number + (5 - remainder)
    }
    else
    {
        return number
    }
}
func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    // just send back the first one, which ought to be the only one
    return paths[0]
}
func writeJson()
{
    var jsonString = "["
    var id = 0
    exercises.forEach()
    {
        exercise in
        jsonString += "\n{\"id\": \(id), \"name\": \"\(exercise.name)\",\"max_weight\": \(exercise.max_weight),\"last_increased\": \"\(exercise.last_increased)\", \"current_week\": \(exercise.current_week),},"
        id += 1
    }
    jsonString += "]"
    let url = getDocumentsDirectory().appendingPathComponent("exercises.json")
    do {
        try jsonString.write(to: url, atomically: true, encoding: .utf8)
        let input = try String(contentsOf: url)
        print(input)
    } catch {
        print(error.localizedDescription)
    }
}
