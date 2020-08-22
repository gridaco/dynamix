import * as UI from "../widgets";
import { actions } from "..";

export namespace Layouts {
    export class SearchItemLayoutBase extends UI.Layout {
        type: string = "bridged.search-item-base";
        constructor() {
            super();
        }

        onTap: actions.IAction<any>
        title: UI.Text
        content?: UI.Text
        avatar?: UI.Avatar | UI.Icon
        meta?: UI.Text
        chips?: Array<UI.Chip>
    }

    export class BasicSearchItemLayout extends SearchItemLayoutBase {
        type: string = "bridged.easy.basic-search-row";
        constructor(params: { avatar?: UI.Avatar | UI.Icon, title: UI.Text, content: UI.Text, meta?: UI.Text, chips?: Array<UI.Chip>, onTap: actions.IAction<any> }) {
            super();
            this.avatar = params.avatar;
            this.title = params.title;
            this.meta = params.meta;
            this.content = params.content;
            this.chips = params.chips;
            this.onTap = params.onTap;
        }
        onTap: actions.IAction<any>
        avatar?: UI.Avatar | UI.Icon
        content: UI.Text
        meta: UI.Text
        title: UI.Text;
        chips?: Array<UI.Chip>
    }

    export class SearchHistoryItemLayout extends SearchItemLayoutBase {
        type: string = "bridged.easy.search-history";
        constructor(params: { title: UI.Text, meta: UI.Text }) {
            super();
            this.title = params.title;
            this.meta = params.meta;
        }

        title: UI.Text;
        meta: UI.Text;
    }

}
