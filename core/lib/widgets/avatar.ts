import { View } from "../_ui";

export class Avatar extends View {
    type: string = "avatar";
    constructor(source: any) {
        super();
        this.source = source;
    }
    source: any
}