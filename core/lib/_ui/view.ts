export abstract class View {
    abstract type: string
    build(): string {
        return JSON.stringify(this, null, 2);
    }
}
