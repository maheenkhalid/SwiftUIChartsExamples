import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: BarChart()) {
                    Text("Bar Chart")
                }
                NavigationLink(destination: BarChart()) {
                    Text("Pie Chart")
                }
            }
        }
        .navigationTitle("Charts")
        
    }
}

#Preview {
    ContentView()
}
