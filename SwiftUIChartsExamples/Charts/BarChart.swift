import Foundation
import SwiftUI
import Charts

struct StudentScore: Identifiable {
    let id = UUID()
    let name: String
    let score: Double
}

struct BarChart: View {
    let data: [StudentScore] = [
        .init(name: "Joe", score: 49),
        .init(name: "James", score: 56),
        .init(name: "Jane", score: 79)
    ]
    
    var body: some View {
        Chart(data) { studentScore in
            BarMark(
                x: .value("Name", studentScore.name),
                y: .value("Score", studentScore.score))
        }
        .frame(height: 300)
    }
}

#Preview {
    BarChart()
}
