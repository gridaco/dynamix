import {UI} from "./index";

export namespace SearchLayouts{
    export interface SearchItemLayoutBase extends UI.Layout{
        title: UI.Text
        content?: UI.View
        avatar?: UI.Avatar
        meta?: UI.View
    }

    export class BasicSearchItemLayout implements SearchItemLayoutBase{
        constructor(params: {title: UI.Text, content: UI.Text, meta: UI.Text, }) {
            this.title = params.title;
            this.meta = params.meta;
            this.content = params.content;
        }
        content: UI.Text
        meta: UI.Text
        title: UI.Text;
    }

    export class SearchHistoryItemLayout implements SearchItemLayoutBase{
        constructor(params: {title: UI.Text, meta: UI.Text}) {
            this.title = params.title;
            this.meta = params.meta;
        }

        title: UI.Text;
        meta: UI.Text;
    }

}
