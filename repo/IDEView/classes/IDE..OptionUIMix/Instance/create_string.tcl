IDE::OptionUIMix instproc create_string {wnomo nomo priskribo} {
    my instvar opcioj
    set opcioj($nomo) [my getOption $nomo]
    frame $wnomo
    ttk::label $wnomo.l -text $priskribo
    ttk::entry $wnomo.e -textvariable [self]::opcioj($nomo)
    pack $wnomo.l $wnomo.e -side left
}
