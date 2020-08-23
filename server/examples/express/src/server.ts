import * as express from 'express'
import * as bodyParser from 'body-parser'
import { resolve } from "path"

const app = express();
import * as cors from 'cors';
import { actions, ui, icons } from "@bridged.xyz/remote-ui-core";
import { startGrpc } from './grpc';
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());



class EXPerson {

}

class EXBook {

}

class EXQuote {

}

class EXWord {

}


class SearchResultLayout extends ui.Layout {
    constructor(props: {
        title: ui.Text
        subtitle: ui.Text
        meta?: ui.Text
        icon: ui.Icon
        action: actions.IAction<any>
        tags?: Array<ui.Chip>
    }) {
        super();
        this.title = props.title;
        this.subtitle = props.subtitle;
        this.meta = props.meta;
        this.icon = props.icon;
        this.action = props.action;
        this.tags = props.tags;
    }

    type: string = "layout.search-row";
    title: ui.Text
    subtitle: ui.Text
    meta?: ui.Text
    icon: ui.Icon
    action: actions.IAction<any>
    tags?: Array<ui.Chip>
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

app.get('/search', async (req, res) => {
    const { query } = req.query;

    await sleep(10);

    const searchResults: Array<SearchResultLayout> = [
        new SearchResultLayout({
            title: new ui.Text("remte ui"),
            subtitle: new ui.Text("load ui dynamically from serverside"),
            action: actions.pushRoute("/home"),
            icon: new ui.Icon(icons.material.accessibility)
        }),
        new SearchResultLayout({
            title: new ui.Text(`${query}`),
            subtitle: new ui.Text("load ui dynamically from serverside"),
            action: actions.pushRoute("/home"),
            meta: new ui.Text(`${Date.now()}`),
            icon: new ui.Icon(icons.material.accessibility)
        }),
        new SearchResultLayout({
            title: new ui.Text(`${query}`),
            subtitle: new ui.Text("load ui dynamically from serverside"),
            action: actions.pushRoute("/home"),
            icon: new ui.Icon(icons.material.accessibility)
        })
    ];
    console.log(searchResults);

    res.json(searchResults);
});

app.post(`/show-dialog`, (req, res) => {
    res.json(req.body).send();
});

// starts grpc server
startGrpc()

app.listen(3001, () =>
    console.log('Server is running on http://localhost:3001'),
);

