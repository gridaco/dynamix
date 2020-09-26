import { Color } from "../colors";
import { View } from "../_ui";

export class Text extends View {
    type: string = "text";
    text: string
    style: TextStyle
    constructor(text: string, args?: {
        style?: TextStyle
    }) {
        super();
        this.text = text;
        this.style = args?.style;
    }
}

export class TextStyle {
    color: Color
    backgroundColor: Color
    fontSize: number
    fontWeight: FontWeight
    fontStyle: FontStyle
    letterSpacing: number
    wordSpacing: number
    height: number

    constructor(props?: {
        color?: Color,
        backgroundColor?: Color,
        fontSize?: number,
        fontWeight?: FontWeight,
        fontStyle?: FontStyle,
        letterSpacing?: number,
        wordSpacing?: number,
        height?: number,
    }) {
        this.color = props.color;
        this.backgroundColor = props.backgroundColor;
        this.fontSize = props.fontSize;
        this.fontWeight = props.fontWeight;
        this.fontStyle = props.fontStyle;
        this.letterSpacing = props.letterSpacing;
        this.wordSpacing = props.wordSpacing;
        this.height = props.height;
    }
}

export class FontWeight {
    constructor(w: number) {
        this.w = w;
    }
    w: number

    /// Thin, the least thick
    static w100: FontWeight = new FontWeight(100);

    /// Extra-light
    static w200: FontWeight = new FontWeight(200);

    /// Light
    static w300: FontWeight = new FontWeight(300);

    /// Normal / regular / plain
    static w400: FontWeight = new FontWeight(400);

    /// Medium
    static w500: FontWeight = new FontWeight(500);

    /// Semi-bold
    static w600: FontWeight = new FontWeight(600);

    /// Bold
    static w700: FontWeight = new FontWeight(700);

    /// Extra-bold
    static w800: FontWeight = new FontWeight(800);

    /// Black, the most thick
    static w900: FontWeight = new FontWeight(900);

    /// The default font weight.
    static normal: FontWeight = FontWeight.w400;

    /// A commonly used font weight that is heavier than normal.
    static bold: FontWeight = FontWeight.w700;

    static values: Array<FontWeight> = [
        FontWeight.w100,
        FontWeight.w200,
        FontWeight.w300,
        FontWeight.w400,
        FontWeight.w500,
        FontWeight.w600,
        FontWeight.w700,
        FontWeight.w800,
        FontWeight.w900,
    ];
}

export enum FontStyle {
    /// Use the upright glyphs
    normal,

    /// Use glyphs designed for slanting
    italic,
}