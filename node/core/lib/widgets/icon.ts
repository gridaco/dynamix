import { icons } from "..";
import { View } from "../_ui";

export class Icon extends View {
    type: string = "icon";
    icon: icons.data
    constructor(icon: icons.data) {
        super();
        this.icon = icon;
    }
}