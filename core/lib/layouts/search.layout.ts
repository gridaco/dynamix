import { UI } from "./index";
import { icons } from "..";

export namespace Layouts {
    export class SearchItemLayoutBase extends UI.Layout {
        constructor() {
            super();
        }

        title: UI.Text
        content?: UI.View
        avatar?: UI.Avatar | UI.Icon
        meta?: UI.View
        chips?: Array<UI.Chip>
    }

    export class BasicSearchItemLayout extends SearchItemLayoutBase {
        constructor(params: { avatar?: UI.Avatar | UI.Icon, title: UI.Text, content: UI.Text, meta?: UI.Text, chips?: Array<UI.Chip> }) {
            super();
            this.avatar = params.avatar;
            this.title = params.title;
            this.meta = params.meta;
            this.content = params.content;
            this.chips = params.chips;
        }
        avatar?: UI.Avatar | UI.Icon
        content: UI.Text
        meta: UI.Text
        title: UI.Text;
        chips?: Array<UI.Chip>
    }

    export class SearchHistoryItemLayout extends SearchItemLayoutBase {
        constructor(params: { title: UI.Text, meta: UI.Text }) {
            super();
            this.title = params.title;
            this.meta = params.meta;
        }

        title: UI.Text;
        meta: UI.Text;
    }

}
