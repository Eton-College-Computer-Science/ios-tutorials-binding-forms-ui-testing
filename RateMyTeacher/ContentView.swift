//
//  ContentView.swift
//  RateMyTeacher
//
//  Created by Cormell, David - DPC on 09/10/2024.
//

import SwiftUI

enum TeacherRating: String {
    case poor, average, excellent
}

struct ContentView: View {
    @State private var teacherRating: TeacherRating?
    @State private var areasForImprovement: String = ""
    @State private var enthusiasm: Double = 5
    @State private var subjectExpertise: Int = 1
    
    var body: some View {
        Form {
            Section(content: {
                TextField("Areas for Improvement", text: $areasForImprovement)
                    .padding()
                Slider(value: $enthusiasm, in: 1...10, label: { Text("Enthusiasm Level") }, minimumValueLabel: { Text("Lettuce Leaf")}, maximumValueLabel: { Text("Energiser Bunny")})
                Picker("Subject Expertise:", selection: $subjectExpertise) {
                    Text("Knows their stuff").tag(3)
                    Text("Not Bad").tag(2)
                    Text("Knows nothing").tag(1)
                }
            }, header: { Text("What do you think of your teacher?") })
            Section(content: {
                Button("Rate!") {
                    rateMyTeacher()
                }
                .padding()
                Text("Teacher Rating: \(teacherRating?.rawValue ?? "Not yet calculated")")
            }, header: { Text("Calculate Rating")} )
            
        }
    }
    
    func rateMyTeacher() {
        if subjectExpertise == 3 && enthusiasm > 7 && areasForImprovement.count <= 10 {
            teacherRating = .excellent
        } else if subjectExpertise >= 2 && enthusiasm > 4 {
            teacherRating = .average
        } else {
            teacherRating = .poor
        }
    }
}

#Preview {
    ContentView()
}
