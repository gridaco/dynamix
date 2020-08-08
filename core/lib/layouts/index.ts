/*
 * Copyright (c) 2020. UZU, J (softmarshmallow) under MIT license.
 * This software is free to use.
 */

import { UI } from "./layout"
import { Layouts as searchLayouts } from "./search.layout"
import { Layouts as materialLayouts } from "./material.layout"

const Layouts = {
    search: searchLayouts,
    material: materialLayouts
}

export {
    UI,
    Layouts,
    Layouts as layouts
}
