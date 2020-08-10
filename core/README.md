# remote ui server core implementation (node)


## UI Importing
```ts
// method 1. root import
import * as rui from "@bridged.io/remote-ui-core";
new rui.UI.Text("remote ui rules  😎")

// method 1. namespace import
import { UI } from "@bridged.io/remote-ui-core";
new UI.Text("remote ui rules  😎")

// method 1. component import
import { Text } from "@bridged.io/remote-ui-core/components";
new Text("remote ui rules 😎")
```



- lang/env node (ts)
- examples
    - express




## dependency
- mustache
- url-pattern
