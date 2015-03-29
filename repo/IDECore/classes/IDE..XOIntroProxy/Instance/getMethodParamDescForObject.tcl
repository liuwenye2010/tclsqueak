IDE::XOIntroProxy instproc getMethodParamDescForObject {object instproc} {
    if {![Object isobject $object] || ![Object isclass [$object info class]]} return
    set arguments [list]
    set defcount 0
    set p [$object procsearch $instproc]
    set class [lindex $p 0]
    foreach arg [$class info instargs $instproc] {
        if {[$class info instdefault $instproc $arg val]} {
            incr defcount
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    list $arguments $defcount [$class info instnonposargs $instproc]
}
