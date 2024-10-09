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
    @State private var enthusiasm: Int = 5
    @State private var subjectExpertise: String = ""
    
    var body: some View {
        VStack {
            Button("Rate!") {
                rateMyTeacher()
            }
            Text("Teacher Rating: \(teacherRating?.rawValue ?? "Not yet calculated")")
        }
        .padding()
    }
    
    func rateMyTeacher() {
        if subjectExpertise == "Knows their stuff" && enthusiasm > 7 && areasForImprovement.count <= 10 {
            teacherRating = .excellent
        } else if subjectExpertise == "Not Bad" && enthusiasm > 4 {
            teacherRating = .average
        } else {
            teacherRating = .poor
        }
    }
}

#Preview {
    ContentView()
}
