import { View } from "../_ui"

interface I_ImageOptions {

}

export class Image extends View {
    src: string
    options?: I_ImageOptions
    constructor(src: string, options?: I_ImageOptions) {
        super()
        this.src = src;
        this.options = options
    }
}