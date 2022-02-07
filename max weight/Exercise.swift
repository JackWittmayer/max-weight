//
//  Exercise.swift
//  max weight
//
//  Created by Jack Wittmayer on 11/11/21.
//

import Foundation

class Exercise: Decodable, Identifiable
{
    var id: Int
    var name: String
    var max_weight: Double
    var last_increased: String
    var current_week: Int
    init(id: Int, name: String, max_weight: Double, last_increased: String, current_week: Int)
    {
        self.id = id
        self.name = name
        self.max_weight = max_weight
        self.last_increased = last_increased
        self.current_week = current_week
    }
}
