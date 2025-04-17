import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: BarChart()) {
                    Text("Bar Chart")
                }
                NavigationLink(destination: LineChart()) {
                    Text("Line Chart")
                }
            }
        }
        .navigationTitle("Charts")
        
    }
}

#Preview {
    ContentView()
}
