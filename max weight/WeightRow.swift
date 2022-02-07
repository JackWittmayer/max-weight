//
//  WeightRow.swift
//  max weight
//
//  Created by Jack Wittmayer on 12/24/21.
//

import SwiftUI

struct WeightRow: View {
    var percent: Double
    var maxWeight: Double
    var highlight: Bool
    var body: some View {
        HStack()
        {
            highlightedText(highlight: highlight, text: String(Int(percent*100)) + "%:")
            Spacer()
            highlightedText(highlight: highlight, text: " \(roundToNearest5(number: Int( maxWeight * percent)))")
            Spacer()
            highlightedText(highlight: highlight, text: " \(String(Double(roundToNearest5(number: Int( maxWeight * percent)-45))/2)) * 2")
        }
    }
    func highlightedText(highlight: Bool, text: String) -> Text
    {
        if (highlight)
        {
            return Text(text).bold()
        }
        else
        {
            return Text(text)
                .fontWeight(.ultraLight)
        }
    }
}

struct WeightRow_Previews: PreviewProvider {
    static var previews: some View {
        WeightRow(percent: 0.65, maxWeight: exercises[0].max_weight, highlight: false)
    }
}
