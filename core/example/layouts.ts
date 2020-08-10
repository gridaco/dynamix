import { icons, UI, layouts, Actions } from "../lib";

// region example
const cardLayout = new layouts.search.BasicSearchItemLayout({
    avatar: new UI.Icon(icons.material.add),
    title: new UI.Text("GY"),
    chips: [
        new UI.Chip(
            new UI.Text("wonder")
        ),
        new UI.Chip(
            new UI.Text("what you're")
        ),
        new UI.Chip(
            new UI.Text("doing")
        )
    ],
    content: new UI.Text("i love you gy"),
    onTap: new Actions.PushRoute("/lovers/gy")
})

console.log(cardLayout);
console.log(cardLayout.build());