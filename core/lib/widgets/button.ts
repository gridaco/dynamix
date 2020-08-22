import { View } from "../_ui";
import { Color } from "../colors";

export class Button extends View {
    type: string = "button";
    onTap: Function
    onLongPress?: Function
    enabled: boolean
    color: Color
    constructor() {
        super();
    }

    static outlined(): Button {
        return new Button();
    }
}