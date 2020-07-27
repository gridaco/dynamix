import {IRouteSpec, RouteInstance, RouteSpec} from "./spec"

const specs: Array<RouteSpec<any, any>> = []

function register(spec) {
    specs.push(spec);
}

function load(json) {

}

async function build(routeData: RouteInstance<any, any>) {
    return await routeData.toDisplay()
}

function match(route): RouteInstance<any, any> {
    for (const spec of specs) {
        const res = spec._compiledPattern.match(route)
        if (res) {
            return new RouteInstance<any, any>({
                name: spec.name, params: res, pattern: spec.pattern
            });
        }
    }
    return null;
}

export {
    register,
    load,
    match,
    build,
    RouteSpec as spec
}
