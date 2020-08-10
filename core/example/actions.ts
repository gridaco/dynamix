import { Actions } from "../lib"
Actions.register()

const popAction = new Actions.PopRoute("*")

const action = Actions.pushRoute("/users/1234").build()
console.log(action);