

export interface  IAction<T>{
    namespace: ActionNamespace; // namespace of this action
    session: string; // session that this action will be sent through
    type: string; // type of action
    message: string; // developer's message
    data: T // data of this action
}


export abstract class BaseAction<T extends IBaseActionData> implements IAction<T>{
    data: T;
    message: string;
    namespace: ActionNamespace;
    session: string;
    type: string;

}

export class TableAction<T> extends BaseAction<T>{
    dumpAction: DumpActionType
}

export enum DumpActionType{
    SINGLE= "SINGLE",
    MULTIPLE = "MULTIPLE",
    NONE = "NONE",
    CUSTOM = "CUSTOM"
}

interface IRoute{

}

interface IBaseActionData{

}


// region general

// region routes

interface IRouteActionData extends IBaseActionData{
    route: string
}

export class PushRoute extends BaseAction<IRouteActionData>{
    namespace = ActionNamespace.GENERAL;
    type = "PUSH_ROUTE";
}

export class PopRoute extends BaseAction<IRouteActionData>{
    namespace = ActionNamespace.GENERAL;
    type = "POP_ROUTE";
}

// endregion routes

// endregion general


export enum ActionNamespace {
    GENERAL,
    MATERIAL,
    CUSTOM

}