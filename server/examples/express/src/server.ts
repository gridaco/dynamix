import * as express from 'express'
import * as bodyParser from 'body-parser'
import { resolve } from "path"

const app = express();
import * as cors from 'cors';
import { actions, ui, icons } from "@bridged.xyz/remote-ui-core";
import { startGrpc } from './grpc';
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


interface SearchResultLayout {
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

    await sleep(120);


    const searchResults: Array<SearchResultLayout> = [
        {
            title: new ui.Text("remte ui"),
            subtitle: new ui.Text("load ui dynamically from serverside"),
            action: actions.pushRoute("/home"),
            icon: new ui.Icon(icons.material.accessibility)
        },
        {
            title: new ui.Text(`${query}`),
            subtitle: new ui.Text("load ui dynamically from serverside"),
            action: actions.pushRoute("/home"),
            meta: new ui.Text(`${Date.now()}`),
            icon: new ui.Icon(icons.material.accessibility)
        },
        {
            title: new ui.Text(`${query}`),
            subtitle: new ui.Text("load ui dynamically from serverside"),
            action: actions.pushRoute("/home"),
            icon: new ui.Icon(icons.material.accessibility)
        }
    ];

    res.json(searchResults);
});


startGrpc()

app.listen(3001, () =>
    console.log('Server is running on http://localhost:3001'),
);

