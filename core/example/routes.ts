import { screens } from "../lib"


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


screens.register(
    new screens.spec(new screens.spec<{ id }, { id, name }>({
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
const spec = screens.match(route)
screens.build(spec).then((d) => {
    console.log(d)
})

