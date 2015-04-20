IDE::CreateComponentDialog instproc init args {
    my instvar win name ootype userMsg namespace installInRepo
    next
    set ootype XOTcl
    set userMsg ""
    set name ""
    set namespace ""
    set installInRepo 1
    my requireNamespace

    frame $win.fname
    label $win.fname.lname -text "Component Name:"
    entry $win.fname.name -textvariable [self]::name

    pack $win.fname.lname $win.fname.name -side left

    frame $win.footype
    label $win.footype.lname -text "Type of Object Oriented System"
    pack $win.footype.lname -side left
    foreach oosystem {XOTcl TclOO} {
        set rwin $win.footype.[string tolower $oosystem]
        radiobutton $rwin -text $oosystem -variable [self]::ootype -value $oosystem
        pack $rwin
    }

    frame $win.fnamespace
    label $win.fnamespace.lname -text "namespace (optional):"
    entry $win.fnamespace.name -textvariable [self]::namespace
    pack $win.fnamespace.lname $win.fnamespace.name -side left

    label $win.userMsg -textvariable [self]::userMsg

    pack $win.fname -anchor w
    pack $win.footype -anchor w
    pack $win.fnamespace
    if {[IDE::System isDatabase]} {
        checkbutton $win.installInRepo -text "Install in repository" -variable [self]::installInRepo
        pack $win.installInRepo -anchor w
    } else {
        set installInRepo 0
    }
    pack $win.userMsg -anchor w


    wm deiconify $win
}
