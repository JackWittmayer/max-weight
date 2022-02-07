//
//  ExerciseList.swift
//  max weight
//
//  Created by Jack Wittmayer on 11/11/21.
//

import Foundation
import SwiftUI

struct ExerciseList: View
{
    @State var addMode = false
    @State var exercises_ = exercises
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View
    {

        NavigationView {
            List
            {
                ForEach(exercises_)
                {
                exercise in
                NavigationLink {
                    ExerciseDetail(exercise: exercise)
                }
                label: {
                    ExerciseRow(exercise: exercise)
                }.onReceive(timer)
                {
                    input in
                    var newArray = [Exercise]()
                    for exercise in exercises_
                    {
                        newArray.append(exercise)
                    }
                    exercises_ = newArray
                }
                }.onDelete(perform: delete).navigationTitle("Exercises")
            }
                .navigationBarItems(trailing:         Button(action: addItem)
                    {
                        Image(systemName: "plus")
                })
        }
    }
    func addItem()
    {
        let exercise = Exercise(id: exercises[exercises.count-1].id+1, name: "New Exercise", max_weight: 0.0, last_increased: "12/25/21", current_week: 0)
        exercises_.append(exercise)
        print(exercises_)
        exercises.append(exercise)
        writeJson()
    }
    func delete(at offsets: IndexSet)
    {
        exercises_.remove(atOffsets: offsets)
        exercises.remove(atOffsets: offsets)
        writeJson()
    }
}

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList()
    }
}
                                                              

                                            
