import * as express from 'express'
import * as bodyParser from 'body-parser'
import { resolve } from "path"
const app = express();
import * as cors from 'cors';
import * as rui from "@bridged.xyz/remote-ui-core";
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


interface SearchResult {
    title: string
    description: string
    avatar: string
    action: rui.actions.PushRoute
}

app.get('/search', (req, res) => {

    const searchResults: Array<SearchResult> = [
        {
            title: "instagram",
            description: "aint it awesome?",
            action: rui.actions.popRoute(""),
            avatar: rui.icons.material.note.uri
        }
    ];

    res.json(searchResults);
});


app.listen(3001, () =>
    console.log('Server is running on http://localhost:3001'),
);

