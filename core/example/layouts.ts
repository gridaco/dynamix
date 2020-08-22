import { icons, ui, layouts, actions } from "../lib";

// region example
const cardLayout = new layouts.search.BasicSearchItemLayout({
    avatar: new ui.Icon(icons.material.add),
    title: new ui.Text("GY"),
    chips: [
        new ui.Chip(
            new ui.Text("wonder")
        ),
        new ui.Chip(
            new ui.Text("what you're")
        ),
        new ui.Chip(
            new ui.Text("doing")
        )
    ],
    content: new ui.Text("i love you gy"),
    onTap: new actions.PushRoute("/lovers/gy")
})

console.log(cardLayout);
console.log(cardLayout.build());