import { FlutterBuilder } from "../platforms/flutter";

export class UITreeElement {
    buildFor(platform: string) {
        switch (platform) {
            case "flutter":
                return FlutterBuilder.build(this)
        }
        throw `${platform} is not available for ui tree building`;
    }
}

export abstract class View extends UITreeElement {
    abstract type: string
    build(): string {
        return JSON.stringify(this, null, 2);
    }
}