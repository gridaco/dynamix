import { Color } from "../lib/colors";
import { FlutterWidgetExtension } from "../lib/platforms/flutter";
// node dynamic to flutter

import { Text } from "../lib/widgets";
import { TextStyle } from "../lib/widgets/text";

const widget = new Text("some text", {
    style: new TextStyle(
        { color: Color.fromHex("#FFFFFF") }
    )
})

const widgetString = widget.buildFor("flutter")

console.log(widgetString)