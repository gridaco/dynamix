import { View } from "../_ui";

export class Text extends View {
    text: string
    options?: {}
    constructor(text: string, oprions?: {}) {
        super();
        this.text = text;
        this.options = oprions;
    }
}
