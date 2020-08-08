import { UI } from "./index";
import { icons } from "..";

export namespace SearchLayouts {
    export interface SearchItemLayoutBase extends UI.Layout {
        title: UI.Text
        content?: UI.View
        avatar?: UI.Avatar | UI.Icon
        meta?: UI.View
        chips?: Array<UI.Chip>
    }

    export class BasicSearchItemLayout implements SearchItemLayoutBase {
        constructor(params: { avatar?: UI.Avatar | UI.Icon, title: UI.Text, content: UI.Text, meta?: UI.Text, chips?: Array<UI.Chip> }) {
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

    export class SearchHistoryItemLayout implements SearchItemLayoutBase {
        constructor(params: { title: UI.Text, meta: UI.Text }) {
            this.title = params.title;
            this.meta = params.meta;
        }

        title: UI.Text;
        meta: UI.Text;
    }

}



// region example
const cardLayout: SearchLayouts.BasicSearchItemLayout = new SearchLayouts.BasicSearchItemLayout({
    avatar: new UI.Icon(icons.material.add),
    title: new UI.Text(""),
    chips: [],
    content: new UI.Text("")
})