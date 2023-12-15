export namespace Colors {
    // todo
}


export class Color {
    value: number;
    hex: string;
    constructor(value: number) {

    }

    static fromHex(hex: string): Color {
        // converts #ffffff to 0xffffff
        const num = parseInt(hex, 16);
        return new Color(num);
    }
}