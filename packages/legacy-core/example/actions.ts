import { actions } from "../lib"
actions.register()

const popAction = new actions.PopRoute("*")

const action = actions.pushRoute("/users/1234").build()
console.log(action);