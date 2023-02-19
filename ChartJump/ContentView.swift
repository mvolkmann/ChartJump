import Charts
import SwiftUI

struct Score: Equatable, Identifiable {
    let name: String
    let score: Int
    var id: String { name }
}

struct ContentView: View {
    @State private var selectedName: String?

    let scores = [
        Score(name: "Mark", score: 3),
        Score(name: "Tami", score: 18),
        Score(name: "Amanda", score: 10),
        Score(name: "Jeremy", score: 21)
    ]

    private var annotation: some View {
        guard let selectedName else { return Text("") }
        let object = scores.first { $0.name == selectedName }
        return Text("\(object?.score ?? 0)")
    }

    var body: some View {
        Chart {
            ForEach(scores) { object in
                let name = PlottableValue.value("Name", object.name)
                let score = PlottableValue.value("Value", object.score)
                LineMark(x: name, y: score)

                if object.name == selectedName {
                    RuleMark(x: name)
                        // .annotation(position: .top) { annotation }
                        .annotation(position: .overlay) { annotation }
                        // Display a red, dashed, vertical line.
                        .foregroundStyle(.red)
                        .lineStyle(StrokeStyle(dash: [10, 5]))
                }
            }
        }
        .chartPlotStyle { plotArea in
            plotArea.frame(height: 300)
        }
        .chartOverlay { proxy in chartOverlay(proxy: proxy) }
        .padding()
    }

    private func chartOverlay(proxy: ChartProxy) -> some View {
        GeometryReader { geometry in
            let origin = geometry[proxy.plotAreaFrame].origin
            Rectangle()
                .fill(.clear)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let location = CGPoint(
                                x: value.location.x - origin.x,
                                y: value.location.y - origin.y
                            )
                            if let (name, _) = proxy.value(
                                at: location,
                                as: (String, Double).self
                            ) {
                                selectedName = name
                            }
                        }
                        .onEnded { _ in selectedName = nil }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
