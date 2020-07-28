/*
 * Copyright (c) 2020. UZU, J (softmarshmallow) under MIT license.
 * This software is free to use.
 */

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
            spec.params = res;
            return new RouteInstance<any, any>(spec);
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
