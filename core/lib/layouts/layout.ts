
/*
 * Copyright (c) 2020. UZU, J (softmarshmallow) under MIT license.
 * This software is free to use.
 */

export namespace UI{
    export class Layout {

    }

    export class View {

    }

    export class Text extends View{
        constructor(text: string) {
            super();
            this.text = text;
        }
        text: string
    }

    export class Avatar extends View{
        constructor(source: any) {
            super();
            this.source = source;
        }
        source: any
    }
}
