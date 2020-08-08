
/*
 * Copyright (c) 2020. UZU, J (softmarshmallow) under MIT license.
 * This software is free to use.
 */

import { icons } from "..";

export namespace UI {
    export class View {
        build(): string {
            return JSON.stringify(this, null, 2);
        }
    }

    export class Layout extends View {

    }

    export class Text extends View {
        constructor(text: string, oprions?: {}) {
            super();
            this.text = text;
            this.options = oprions;
        }
        text: string
        options?: {}
    }

    export class Icon extends View {
        icon: icons.data
        constructor(icon: icons.data) {
            super();
            this.icon = icon;
        }
    }

    export class Avatar extends View {
        constructor(source: any) {
            super();
            this.source = source;
        }
        source: any
    }

    export class Chip extends View {
        label: Text
        avatar?: View

        constructor() {
            super();
        }
    }
}
