IDE::IntroProxy proc getBaseObjDef name {
    set cname [my stripNamespace [$name info class]]
    return "$cname create [string trimleft $name :]"
}
