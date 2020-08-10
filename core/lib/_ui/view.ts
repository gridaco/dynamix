export class View {
    build(): string {
        return JSON.stringify(this, null, 2);
    }
}
