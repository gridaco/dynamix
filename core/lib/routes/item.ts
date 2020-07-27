export interface IRouteItem {
    title: string
    description: string
    route: string
    icon: string
}

export class RouteItem implements IRouteItem {
    description: string;
    icon: string;
    route: string;
    title: string;

    constructor(props) {
    }

    static fromSpec(spec, params): RouteItem {
        return new RouteItem({
            spec: spec,
            params: params
        });
    }
}