//
//  ExerciseRow.swift
//  max weight
//
//  Created by Jack Wittmayer on 11/11/21.
//

import Foundation
import SwiftUI

struct ExerciseRow: View {
    var exercise: Exercise
    var body: some View {
        HStack {
            Text(exercise.name)
        }
    }
}

struct ExerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRow(exercise: exercises[0])
    }
}
