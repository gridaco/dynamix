import UrlPattern from "url-pattern";
import {RemoteIconData} from "../icons";
import MaterialIcons from "../icons/material-icons";

export interface IRouteDisplay {
    title: string
    description: string
    route: string
    icon: RemoteIconData
}

export class RouteDisplay implements IRouteDisplay {
    description: string;
    icon: RemoteIconData;
    route: string;
    title: string;

    constructor(props) {
    }

    static fromSpec(spec, params): RouteDisplay {
        return new RouteDisplay({
            spec: spec,
            params: params
        });
    }
}

export interface IRouteSpec<P, T> {
    pattern: string
    name: string
    params?: P
    defaultTitle?: string
    defaultDescription?: string
    defaultIcon?: RemoteIconData
    dataFetcher?: (params: P) => Promise<T>
    titleTemplate?: string
    descriptionTemplate?: string
    titleBuilder?: string
    descriptionBuilder?: string
    iconBuilder?: string
}


export class RouteSpec<P, T> implements IRouteSpec<P, T> {

    pattern: string
    name: string
    params: P
    data: T
    _compiledPattern: UrlPattern

    constructor(props: IRouteSpec<P, T>) {
        Object.assign(this, props)
        this._compiledPattern = new UrlPattern(this.pattern)
    }

    async fetchData(): Promise<T> {
        return undefined;
    }

}


export class RouteInstance<P, T> extends RouteSpec<P, T> {
    data: T

    constructor(props: IRouteSpec<P, T>) {
        super({
            name: props.name,
            params: props.params,
            pattern: props.pattern
        });
    }

    async toDisplay(): Promise<RouteDisplay> {
        return {
            title: "",
            description: "",
            icon: MaterialIcons.add,
            route: this._compiledPattern.stringify(this.params),
        };
    }
}
