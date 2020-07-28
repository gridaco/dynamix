import UrlPattern from "url-pattern";
import {RemoteIconData} from "../icons";
import MaterialIcons from "../icons/material-icons";
import * as Mustache from "mustache"

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

export enum RouteType {
    LIST,
    DETAIL,
    HOME,
    MIXED
}

export interface IRouteSpec<P, T> {
    pattern: string
    key: string
    params?: P
    type?: RouteType

    dataFetcher?: (params: P) => Promise<T>

    title: DisplayFieldBuilder<T, string>
    description?: DisplayFieldBuilder<T, string>
    icon?: DisplayFieldBuilder<T, RemoteIconData>
}

interface DisplayFieldBuilder<I, O> {
    default: O
    template?: string
    builder?: (data: I) => O
}

export class RouteSpec<P, T> implements IRouteSpec<P, T> {

    pattern: string
    key: string
    params: P
    data: T
    type: RouteType;
    dataFetcher: (params: P) => Promise<T>;

    title: DisplayFieldBuilder<T, string>;
    description?: DisplayFieldBuilder<T, string>;
    icon?: DisplayFieldBuilder<T, RemoteIconData>;

    _compiledPattern: UrlPattern

    constructor(props: IRouteSpec<P, T>) {
        Object.assign(this, props)
        this._compiledPattern = new UrlPattern(this.pattern)
    }


    async fetchData(): Promise<T> {
        if (this.data) {
            return this.data;
        }
        if (this.dataFetcher) {
            this.data = await this.dataFetcher(this.params);
            return this.data;
        }
        return undefined;
    }

}


export class RouteInstance<P, T> extends RouteSpec<P, T> {
    data: T

    constructor(props: IRouteSpec<P, T>) {
        super({
            dataFetcher: props.dataFetcher,
            type: props.type,
            description: props.description,
            icon: props.icon,
            title: props.title,
            key: props.key,
            params: props.params,
            pattern: props.pattern
        });
    }

    async toDisplay(): Promise<RouteDisplay> {
        return {
            title: await this.buildTitle(),
            description: await this.buildDescription(),
            icon: await this.buildIcon(),
            route: this.buildRoute(),
        };
    }

    buildRoute(): string {
        return this._compiledPattern.stringify(this.params)
    }

    async buildTitle(): Promise<string> {
        const data = await this.fetchData();
        return buildField<T, string>(data, this.title);
    }

    async buildDescription(): Promise<string> {
        const data = await this.fetchData();
        return buildField<T, string>(data, this.description);
    }

    async buildIcon(): Promise<RemoteIconData> {
        const data = await this.fetchData();
        return buildField<T, RemoteIconData>(data, this.icon);
    }
}


function buildField<I, O>(data: I, field: DisplayFieldBuilder<I, O>): O {
    if (!field) {
        return undefined
    }
    if (field.builder) {
        return field.builder(data);
    }
    if (field.template) {
        return Mustache.render(field.template, data);
    }
    return field.default;
}
