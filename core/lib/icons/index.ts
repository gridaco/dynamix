
export enum RemoteIconType {
    MATERIAL_NATIVE = "MATERIAL_NATIVE",
    REMOTE_RESOURCE = "REMOTE_RESOURCE",
    LOCAL_ASSET = "LOCAL_ASSET"
}

export class RemoteIconData {
    uri: string;
    type: RemoteIconType;
    asset: string;

    get iconNameFromUri() {
        if (this.type == RemoteIconType.MATERIAL_NATIVE) {
            return this.uri.replace("material://Icons.", "")
        }
        throw Error(
            "this icon data does not contain flutter native material icon data ");
    }


    constructor(props: {
        uri: string,
        type: RemoteIconType
        asset?: string
    }) {
        this.uri = props.uri;
        this.type = props.type;
        this.asset = props.asset;
    }


    /// official material icon name. e.g. person, person_add
    static fromMaterial(iconName: string): RemoteIconData {
        return new RemoteIconData({
            uri: `material://Icons.${iconName}`, type: RemoteIconType.MATERIAL_NATIVE
        })
    }


    static fromUri(uri: string): RemoteIconData {
        // parse type from uri
        let type;
        if (uri.includes("asset://")) {
            type = RemoteIconType.LOCAL_ASSET;
        } else if (uri.includes("http://") || uri.includes("https://")) {
            type = RemoteIconType.REMOTE_RESOURCE;
        } else if (uri.includes("material://")) {
            type = RemoteIconType.MATERIAL_NATIVE;
        }
        return new RemoteIconData({uri: uri, type: type});
    }

    /// builds RemoteIconData with clients' local asset
    static fromAssets(asset: string): RemoteIconData {
        return new RemoteIconData({
                uri: `asset://${asset}`, type: RemoteIconType.LOCAL_ASSET, asset: asset
            }
        )
    }

    /// resource = remote file url
    static fromRemote(resource: string): RemoteIconData {
        throw Error("not implemented");
        // 1. validate
        //    return new RemoteIconData("");
    }

    static fromBase64(base64: string): RemoteIconData {
        throw Error("not implemented");
    }
}


export * as MaterialIcons from "./material-icons"