import {RouteData, RouteSpec} from "./spec"

function register() {

}

function load(json) {

}


function build(routeData: RouteData<any>) {

}

function match(route): RouteSpec {
    // find route spec by route
    return undefined;
}

export {
    register,
    load,
    match,
    build,
    RouteSpec as spec
}