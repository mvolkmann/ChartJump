# ChartJump

This is a simple SwiftUI app that demonstrates an issue
with adding a `RuleMark` to a Swift Chart.

All the relevant code is in the file `ContentView.swift`
and it is fairly short.

Drag over the chart to display an annotation above it
that displays the value corresponding to the name
your finger is over.

Note how the y-axis scale changes while dragging
which causes the entire chart to jump.

Is this a bug in Swift Charts or is there something
I can change in the code to prevent this?

<img alt="without drag"
  src="https://github.com/mvolkmann/ChartJump/raw/main/chart-without-drag.png" />
<img alt="with drag"
  src="https://github.com/mvolkmann/ChartJump/raw/main/chart-with-drag.png" />
