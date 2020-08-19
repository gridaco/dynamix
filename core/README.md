# remote ui core [![](https://img.shields.io/badge/npm-latest-brightgreen)](https://www.npmjs.com/package/@bridged.xyz/remote-ui-core)

> New to remote-ui? read [this](../README.md)
> "remote-ui is for sending client built-ui-data. yes you can customize the looks, but not a recommanded way."

## Installation
```sh
# install with yarn
yarn add @bridged.xyz/remote-ui-core

# install with npm
npm install @bridged.xyz/remote-ui-core
```

## UI Importing
```ts
// method 1. root import
import * as rui from "@bridged.xyz/remote-ui-core";
new rui.UI.Text("remote ui rules  😎")

// method 2. namespace import
import { UI } from "@bridged.xyz/remote-ui-core";
new UI.Text("remote ui rules  😎")

// method 3. component import
import { Text } from "@bridged.xyz/remote-ui-core/components";
new Text("remote ui rules 😎")
```



## Usage: Building Layout / Component
```ts
import { icons, UI, layouts, Actions } from "@bridged.xyz/remote-ui-core";

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

console.log(cardLayout.build());
```

logs...
```json
{
  "avatar": {
    "icon": {
      "uri": "material://Icons.add",
      "type": "MATERIAL_NATIVE"
    }
  },
  "title": {
    "text": "GY"
  },
  "content": {
    "text": "i love you gy"
  },
  "chips": [
    {
      "label": {
        "text": "wonder"
      }
    },
    {
      "label": {
        "text": "what you're"
      }
    },
    {
      "label": {
        "text": "doing"
      }
    }
  ],
  "onTap": {
    "data": {
      "route": "/lovers/gy"
    },
    "namespace": "GENERAL",
    "session": {
      "id": "3GaskEig7epzIFTXYfG2Zw=="
    },
    "type": "PUSH_ROUTE"
  }
}
```


## Concepts
- Actions
- Components
- Layouts
- Screens


## Examples

**code**
[remote-ui-core usage example](../example)



## dependency
- mustache
- url-pattern
