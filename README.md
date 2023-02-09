# ChartJump

style {
  img {
    border: 1px solid gray;
  }
}

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

In the screenshots below,
the left one shows the chart before dragging a finger over it
and the right one shows the chart during dragging.
Note that in the left one the y-axis goes from 0 to 30
and in the right one the y-axis goes from 0 to 40.

<img alt="without drag"
  src="raw/main/chart-without-drag.png"
  style="width: 40%" />
<img alt="with drag"
  src="raw/main/chart-with-drag.png"
  style="width: 40%" />
