//
//  ExerciseDetail.swift
//  max weight
//
//  Created by Jack Wittmayer on 11/11/21.
//

import SwiftUI

struct ExerciseDetail: View {
    let percents = [0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95]
    @State var maxWeight: Double
    var exercise: Exercise
    @State var input_max: String
    @State var input_name: String
    @State var current_week: Int
    init(exercise: Exercise)
    {
        self.exercise = exercise
        maxWeight = exercise.max_weight
        input_max = String(exercise.max_weight)
        input_name = String(exercise.name)
        current_week = exercise.current_week
    }
    var body: some View {
            VStack(alignment: .leading)
                {
                    TextField("Enter Name", text:$input_name).onSubmit {
                        exercise.name = input_name
                        writeJson()
                    }
                    TextField("Enter Weight", text: $input_max).onSubmit {
                        maxWeight = Double(input_max)!
                        exercise.max_weight = maxWeight
                        
                        writeJson()
                    }
                    let time_passed = UpdateDates(exercise: exercise)
                    Text("Last changed " + String(time_passed) + " weeks ago on " + exercise.last_increased)
                    Picker(selection: $current_week, label: Text("Current Week"))
                    {
                        Text("Week 1").tag(0)
                        Text("Week 2").tag(1)
                        Text("Week 3").tag(2)
                    }.onChange(of: current_week) {
                        tag in
                        exercise.current_week = current_week
                        writeJson()
                    }
                    
                    Divider()
                        List(percents, id: \.self)
                        {
                            percent in
                            WeightRow(percent: percent, maxWeight: maxWeight, highlight: shouldHighlight(percent: percent, current_week: current_week))
                        }
                    
            }.padding()
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    func shouldHighlight(percent: Double, current_week: Int) -> Bool
    {
        if ((current_week == 0 && [0.65, 0.75, 0.85].contains(percent)) || (current_week == 1 && [0.70, 0.80, 0.90].contains(percent)) || (current_week == 2 && [0.75, 0.85, 0.95].contains(percent)))
        {
            return true
        }
        else
        {
            return false
        }
    }
    func UpdateDates(exercise: Exercise) -> Int
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let previousDate = dateFormatter.date(from: exercise.last_increased)!
        let currentDate = Date()
        let currentDateString = dateFormatter.string(from: currentDate)
        let time_passed = Calendar.current.dateComponents([.weekOfMonth], from: Date(), to: previousDate).weekOfMonth!
        exercise.last_increased = currentDateString
        return time_passed
    }
}

struct ExerciseDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetail(exercise: exercises[0])
    }
}
