![logo](docs/logo.png)



# remote-ui



server - dynamically change client specs from server

client - dynamically load content from server & with dynamic layout / component / action specs



## Installation

Server side

```shell
# install with yarn
yarn add @bridged.io/remote-ui-core

# install with npm
npm install @bridged.io/remote-ui-core
```








## How to use
server side (express/ts)
```ts
import * as rui from "@bridged.io/remote-ui-core"

router.get("ui", (req, res)=>{

 const ui = new rui.Layout(
  {
   icon: rui.icons.material.note.uri,
   title: new rui.Text("hello world!")
  }
 );
 res.json(ui).send()
})
```



app side (flutter)
```dart
import "package:flutter_remote_ui/flutter_remote_ui.dart"

Widget buildRui(BuildContext context){
 final ruiData = fetchRuiDataFromServer();
 return RemoteUI.of(context).build(ruiiData);
}
```



Concepts & onthology will be documented under notion document, which will be added soon.



## Platform support

**Web**

* server
  * language: ts/js [@bridged.io/remote-ui-core](https://github.com/softmarshmallow/remote-ui/tree/master/core)
  * examples: [express](https://github.com/softmarshmallow/remote-ui/tree/master/server/examples/express), [plain](https://github.com/softmarshmallow/remote-ui/tree/master/server/examples/plain)
* client
  * Language: ts/js
  * Examples: vue


**App**

* [flutter-remote-ui](https://github.com/softmarshmallow/remote-ui/tree/master/flutter-remote-ui)
  * examples: [flutter remote ui example](https://github.com/softmarshmallow/remote-ui/tree/master/flutter-remote-ui/example)
* android
* ios



## Remote Icons

```typescript
import * as rui from "@bridged.io/remote-ui-core"

console.log(rui.icons.material.note)

/// logs 
/// RemoteIconData {
///  uri: 'material://Icons.note',
///  type: 'MATERIAL_NATIVE',
///  asset: undefined }


/// can be used directly on flutter
```

## Remote Route Specs

```typescript
import {routes} from "@bridged.io/remote-ui-core"


const MOCK_DATABASE = {
    users: [
        {
            id: "1",
            name: "softmarshmallow"
        },
        {
            id: "2",
            name: "GY"
        },
        {
            id: "3",
            name: "gin"
        },
    ]
}

function fetchUserFromMockDatabase(id: string): { id, name } {
    return MOCK_DATABASE.users.find((e) => e.id == id);
}


routes.register(
    new routes.spec(new routes.spec<{ id }, { id, name }>({
        key: "/users/:id",
        pattern: "/users/:id",
        dataFetcher: async (p) => {
            return fetchUserFromMockDatabase(p.id);
        },
        title: {
            default: "user detail",
            template: "user {{ data.name }}",
        }
    }))
)

const route = "/users/1";
const spec = routes.match(route)
routes.build(spec).then((d) => {
    console.log(d)
})


/// logs
/// { title: 'user softmarshmallow',
///  description: undefined,
///  icon: undefined,
///  route: '/users/1' }

```





## Contribution
[contribution guideline](CONTRIBUTING.md)

## TODO
* remote ui dashboard -> customize & configure your app through web interface remotely, realtime.



## related projects
- [bridged.io](https://github.com/softmarshmallow/bridged.io)
- [bridged's inapp-bridge](https://github.com/softmarshmallow/inapp-bridge)
- [bridged's schema-studio](https://github.com/softmarshmallow/schema-studio)


### Sponsors


### References
[dynamic_widget](https://github.com/dengyin2000/dynamic_widget)


### Blogs
[starting remote ui project](https://medium.com/launchers/starting-remote-ui-project-4b1d0841afc2)

