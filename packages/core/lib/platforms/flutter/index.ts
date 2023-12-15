import { Text, TextStyle } from "../../widgets/text";
import { UITreeElement } from "../../_ui/view"



export class FlutterWidgetExtension {
    static textToWidget(w: Text): string {
        const builder = new WidgetElementBuilder("Text", w.text);
        builder.addNamedArgument("style", FlutterWidgetExtension.textStyleToWidget(w.style));
        return builder.build();
    }

    static textStyleToWidget(w: TextStyle): string {
        const builder = new WidgetElementBuilder("TextStyle");
        // todo -> add arguments for text style
        return builder.build()
    }
}

export class FlutterBuilder {
    static build(tree) {
        const properties = Object.getOwnPropertyDescriptors(tree)
        return properties
    }
}


class WidgetElementBuilder {
    name: string
    defaultArguments: any[]
    namedArguments: Map<String, String> = new Map();

    constructor(name, ...args) {
        this.name = name
        this.defaultArguments = args
    }

    addNamedArgument(name: string, value: string) {
        this.namedArguments[name] = value;
    }

    private buildDefaultArguments(): string {
        let s = "";
        this.defaultArguments.forEach((v, i) => {
            s += v + ","
        })
        return s;
    }

    private buildNamedArguments() {
        let s = ""
        this.namedArguments?.forEach((k, v) => {
            s + `${k}: ${v}, `
        })
        return s;
    }

    build() {
        return `
${this.name}(
    ${this.buildDefaultArguments()}
    ${this.buildNamedArguments()}
)`
    }
}