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

Is this a bug in Swift Charts?
A workaround was proposed by @MTBff at https://developer.apple.com/forums/thread/724770.
Specifying the y-axis scale as shown below fixes the issue!
However, this probably should not be required.

```swift
Chart {
    ...
}
.chartYScale(domain: 0...50)
```


In the screenshots below,
the left one shows the chart before dragging a finger over it
and the right one shows the chart during dragging.
Note that in the left one the y-axis goes from 0 to 30
and in the right one the y-axis goes from 0 to 40.

<img alt="without drag"
  src="https://github.com/mvolkmann/ChartJump/raw/main/chart-without-drag.png"
  style="border: 1px solid gray; width: 40%" />
<img alt="with drag"
  src="https://github.com/mvolkmann/ChartJump/raw/main/chart-with-drag.png"
  style="border: 1px solid gray; width: 40%" />
