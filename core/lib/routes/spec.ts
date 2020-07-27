export interface IRouteSpec {
    pattern: string
    name: string
    params: {}
}

export class RouteSpec implements IRouteSpec {
    constructor(props) {
    }

    pattern: string
    name: string
    params: {}
}


export class RouteData<T> {
    spec: RouteSpec
    data: T
}

export interface RouteBuilder {
    spec: RouteSpec
    builder: any
    template: string
}