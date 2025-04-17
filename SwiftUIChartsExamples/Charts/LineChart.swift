import SwiftUI
import Charts

struct DailyTemperature: Identifiable {
    let id = UUID()
    let time: String
    let temperature: Double
}

struct LineChart: View {
    let data: [DailyTemperature] = [
        .init(time: "00", temperature: 5),
        .init(time: "03", temperature: 7),
        .init(time: "06", temperature: 8),
        .init(time: "09", temperature: 12),
        .init(time: "12", temperature: 16),
        .init(time: "15", temperature: 15),
        .init(time: "18", temperature: 14),
        .init(time: "21", temperature: 8),
    ]
    
    @State private var selectedData: DailyTemperature?
    
    
    var body: some View {
        Chart {
            ForEach(data) { item in
                LineMark(
                    x: .value("Time", item.time),
                    y: .value("Temperature", item.temperature)
                )
                .foregroundStyle(.orange)
                
                // Highlight selected point
                if selectedData?.id == item.id {
                    PointMark(
                        x: .value("Time", item.time),
                        y: .value("Temperature", item.temperature)
                    )
                    .foregroundStyle(.red)
                    .symbolSize(100)
                    .annotation(position: .top) {
                        Text("\(item.temperature, specifier: "%.1f")")
                            .font(.caption)
                            .padding(4)
                            .background(.white.opacity(0.8))
                            .cornerRadius(5)
                    }
                }
            }
            
            
            RuleMark(y: .value("10 Degree", 12))
                .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                .foregroundStyle(.red)
        }
        .frame(height: 300)
        .chartOverlay { proxy in
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let xPosition = value.location.x - geometry[proxy.plotFrame!].origin.x
                                if let dateValue: String = proxy.value(atX: xPosition) {
                                    // Find the closest match (exact match here because we use day as a String)
                                    if let match = data.first(where: { $0.time == dateValue }) {
                                        selectedData = match
                                    }
                                }
                            }
                    )
            }
        }
    }
}

#Preview {
    LineChart()
}
