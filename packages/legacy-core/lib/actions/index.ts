/*
 * Copyright (c) 2020. UZU, J (softmarshmallow) under MIT license.
 * This software is free to use.
 */

import { Session, SessionManager } from "../_utils/_session";
import { assert } from "console";

export namespace Actions {
    export function register() {
        // todo
    }

    export interface IAction<T extends IBaseActionData> {
        // namespace of this action
        namespace: ActionNamespace;
        // session that this action will be sent through
        session: Session;
        // timeout of the session in seconds
        timeout: number;
        // type of action
        type: string;
        // developer's message
        message: string;
        // data of this action
        data: T
        // any extra meta data you want this action to hold. (general purpose)
        extra: any
    }

    interface IBaseActionData {

    }

    export abstract class BaseAction<T extends IBaseActionData> implements IAction<T> {
        data: T;
        message: string;
        namespace: ActionNamespace;
        session: Session;
        type: string;
        extra: any;
        timeout: number;
    }

    interface IRoute {

    }

    export class ActionData<T> implements BaseAction<T> {
        data: T;
        message: string;
        namespace: Actions.ActionNamespace;
        session: Session;
        type: string;
        extra: any;
        timeout: number;

        constructor(
            props: {
                data: T,
                message?: string,
                namespace?: Actions.ActionNamespace,
                type?: string
            }
        ) {
            assert(this.namespace || props.namespace);
            this.data = props.data;
            this.namespace = props.namespace && props.namespace;
            this.message = props.message;
            this.session = SessionManager.newSession();
            this.type = props.type;
        }

        build(): string {
            return JSON.stringify(this)
        }
    }


    // region general

    // region routes

    interface IRouteActionData extends IBaseActionData {
        route: string
    }

    interface IDialogBody extends IBaseActionData {
        content: string
    }

    interface ITextDialogBody extends IDialogBody {
        content: string
        title?: string
    }

    interface IWebDialogBody extends IDialogBody {
        content: string
    }

    export class PushRoute extends ActionData<IRouteActionData> {
        namespace = ActionNamespace.GENERAL;
        type = "PUSH_ROUTE";

        constructor(route: string) {
            super({
                data: {
                    route: route
                }
            });
        }
    }

    export class PopRoute extends ActionData<IRouteActionData> {
        namespace = ActionNamespace.GENERAL;
        type = "POP_ROUTE";

        constructor(route: string) {
            super({
                data: {
                    route: route
                }
            });
        }
    }

    // endregion routes

    // endregion general

    export function pushRoute(route: string): ActionData<IRouteActionData> {
        return new PushRoute(route);
    }

    export function popRoute(route: string): ActionData<IRouteActionData> {
        return new PopRoute(route);
    }

    export function showShortDialog(message: string): ActionData<ITextDialogBody> {
        return new ActionData({
            data: {
                content: ""
            },
            type: "showShortDialog",
            namespace: ActionNamespace.GENERAL,
        });
    }

    export function showDetailedDialog(title: string, message: string): ActionData<ITextDialogBody> {
        return new ActionData({
            data: {
                content: ""
            },
            type: "showDetailedDialog",
            namespace: ActionNamespace.GENERAL,
        });
    }

    export function showWebDialog(url: string): ActionData<IWebDialogBody> {
        return new ActionData({
            data: {
                content: url
            },
            type: "showWebDialog",
            namespace: ActionNamespace.GENERAL,
        });
    }

    export function showSnack() {
        return new ActionData({
            data: {
                content: ""
            },
            type: "showSnack",
            namespace: ActionNamespace.MATERIAL,
        });
    }


    export enum ActionNamespace {
        GENERAL = "GENERAL",
        MATERIAL = "MATERIAL",
        CUSTOM = "CUSTOM"
    }
}
