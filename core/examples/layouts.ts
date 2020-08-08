import { icons, ui, layouts } from "../lib";

// region example
const cardLayout = new layouts.search.BasicSearchItemLayout({
    avatar: new ui.Icon(icons.material.add),
    title: new ui.Text(""),
    chips: [],
    content: new ui.Text("")
})


console.log(cardLayout.build());