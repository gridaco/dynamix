import { AppActions, AppPageUrls } from "./resources";

export class RULayout<BodyType> {
    public version: string;
    public layout: string;
    public variant: string;
    public body: BodyType;

    public constructor(init?: Partial<RULayout<BodyType>>) {
        Object.assign(this, init);
    }
}

abstract class RUWidget {
    public type: string;
    public variant: string;
    public version: string;

    protected constructor(init?: Partial<RUWidget>) {
        Object.assign(this, init);
    }
}

export class RUImage extends RUWidget {
    public type = "image";
    public src: string;

    public constructor(init?: Partial<RUImage>) {
        super(init);
        Object.assign(this, init);
    }
}

export class RUText extends RUWidget {
    public type = "text";
    public content: string;

    public constructor(init?: Partial<RUText>) {
        super(init);
        Object.assign(this, init);
    }
}

export class RUButton extends RUWidget {
    public type = "button";
    public content: string;
    public action: string;
    public state: ButtonState = ButtonState.ENABLED;

    public constructor(init?: Partial<RUButton>) {
        super(init);
        Object.assign(this, init);
    }
}

export enum ButtonState {
    ENABLED = "ENABLED",
    DISABLED = "DISABLED"
}

export class RUActionString {
    public static pushNativePage(page: AppPageUrls): string {
        return JSON.stringify({
            action: {
                name: AppActions.PushNativePage,
                page,
                data: {}
            }
        });
    }

    public static pushPage(url: string): string {
        return JSON.stringify({
            action: {
                name: AppActions.PushPage,
                url,
            }
        });
    }

    public static showShortDialog(message: string): string {
        return JSON.stringify({
            action: {
                name: AppActions.ShowShortDialog,
                message
            }
        });
    }

    public static showDetailedDialog(title: string, message: string): string {
        return JSON.stringify({
            action: {
                name: AppActions.ShowDetailedDialog,
                title,
                message
            }
        });
    }

    public static showWebDialog(url: string): string {
        return JSON.stringify({
            action: {
                name: AppActions.ShowWebDialog,
                url
            }
        })
    }

    public static showToast(message: string): string {
        return JSON.stringify({
            action: {
                name: AppActions.ShowToast,
                message
            }
        });
    }
}
// endregion action
