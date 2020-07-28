import UrlPattern from "url-pattern";
import {RemoteIconData} from "../icons";
import MaterialIcons from "../icons/material-icons";
import * as Mustache from "mustache"

interface IRouteDisplay {
    title: string
    description: string
    route: string
    icon: RemoteIconData
}

/**
 * a route display data for sending built route data to client. if your client uses remote-ui, it will draw a interactive button, listTile, etc, . automatically targets the route provided.
 */
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


/**
 * @type:P the interface structure type of parameter. e.g. "/users/:id" will take param type { id: string }
 * @type:T the data type used for building route contents like, title, description, icon
 * @field:pattern a unique url  pattern for this route. e.g. "/users/:id"
 * @field:key use for loading template, or localized string (template formatted) automatically builds child's key. e.g. if key "menu/user" is provided, it will make title field's key as "menu/user/title" if no override key is provided
 * @field:params a parsed params value for built route input. e.g. if "/user/123" is provided, params will be { id : "123"}
 * @field:type a type of this route.
 * @function:dataFetcher a function for loading data T via provided params P.
 */
export interface IRouteSpec<P, T> {
    pattern: string
    key: string
    params?: P
    type?: RouteType

    dataFetcher?: (params: P) => Promise<T>

    title: IDisplayFieldBuilder<P, T, string>
    description?: IDisplayFieldBuilder<P, T, string>
    icon?: IDisplayFieldBuilder<P, T, RemoteIconData>
}

/**
 * a data container interface for building route's specific field. for example, title. (used along with function buildField)
 * @type:I input data type
 * @type:O output value type
 * @field:default a fallback string or default value if no template, key, builder is provided
 * @field:key use for loading template, or localized string (template formatted)
 * @field:template a mustache based template, data I from RouteSpec is filled automatically. use valid template. if template is not valid, fallback default value will be returned
 * @field:builder a builder function which takes I as input and returns O as output
 */
interface IDisplayFieldBuilder<P, I, O> {
    default: O
    key?: string
    template?: string
    builder?: (data: IDisplayFieldBuilderInput<P, I>) => O
}

interface IDisplayFieldBuilderInput<P, T> {
    data: T
    params: P
    key: string
}

function buildField<P, T, O>(data: IDisplayFieldBuilderInput<P, T>, field: IDisplayFieldBuilder<P, T, O>): O {
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


export class RouteSpec<P, T> implements IRouteSpec<P, T> {

    pattern: string
    key: string
    params: P
    data: T
    type: RouteType;
    dataFetcher: (params: P) => Promise<T>;

    title: IDisplayFieldBuilder<P, T, string>;
    description?: IDisplayFieldBuilder<P, T, string>;
    icon?: IDisplayFieldBuilder<P, T, RemoteIconData>;

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
        const input: IDisplayFieldBuilderInput<P, T> = {
            data: data,
            params: this.params,
            key: this.title.key,
        }
        return buildField<P, T, string>(input, this.title);
    }

    async buildDescription(): Promise<string> {
        const data = await this.fetchData();
        const input: IDisplayFieldBuilderInput<P, T> = {
            data: data,
            params: this.params,
            key: this.description?.key,
        }
        return buildField<P, T, string>(input, this.description);
    }

    async buildIcon(): Promise<RemoteIconData> {
        const data = await this.fetchData();
        const input: IDisplayFieldBuilderInput<P, T> = {
            data: data,
            params: this.params,
            key: this.icon?.key,
        }
        return buildField<P, T, RemoteIconData>(input, this.icon);
    }
}