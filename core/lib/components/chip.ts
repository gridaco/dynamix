import { View } from "../_ui";
import { Text } from "./text";

export class Chip extends View {
    label: Text
    avatar?: View

    constructor(label: Text,) {
        super();
    }
}