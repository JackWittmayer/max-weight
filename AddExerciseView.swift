//
//  AddExerciseView.swift
//  max weight
//
//  Created by Jack Wittmayer on 12/24/21.
//

import SwiftUI

struct AddExerciseView: View {
    @State var maxWeight = ""
    @State var maxWeightDouble = 0.0
    @State var name = ""
    var body: some View {
        HStack
        {
            Spacer().padding()
            VStack()
            {
                TextField("Name", text: $name)
                TextField("Max Weight", text: $maxWeight).keyboardType(.decimalPad)
                Button(action: createExercise)
                {
                    Text("Create Exercise")
                }
            }.navigationTitle("Add Exercise")
            Spacer().padding()
        }
    }
    func createExercise()
    {
        
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView()
    }
}


