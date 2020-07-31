/*
 * Copyright (c) 2020. UZU, J (softmarshmallow) under MIT license.
 * This software is free to use.
 */

import * as crypto from "crypto";


export class Session {
    id: string

    // optionally pass session id, if not passed, automatically assign new base64 based id
    constructor(props?: { id?: string }) {
        if (props?.id) {
            this.id = props.id
        } else {
            this.id = crypto.randomBytes(16).toString('base64');
        }
    }
}

export class SessionManager {
    static newSession(): Session {
        return new Session();
    }
}