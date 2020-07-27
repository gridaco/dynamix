import {routes} from "../../index"


routes.register()
routes.load({})

const a = new routes.spec({})


const route = "/users/1";
const spec = routes.match(route)


const item = routes.build(undefined)
