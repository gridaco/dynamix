import {routes} from "../../index"


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

function fetchUserFromMockDatabase(id: string){
    return MOCK_DATABASE.users.find((e) => e.id == id);
}


routes.register(
    new routes.spec({
        name: "/users/:id",
        pattern: "/users/:id"
    })
)
// routes.load({})


const route = "/users/1";
const spec = routes.match(route)
console.log(spec)
routes.build(spec).then((d)=>{
    console.log(d)
})

