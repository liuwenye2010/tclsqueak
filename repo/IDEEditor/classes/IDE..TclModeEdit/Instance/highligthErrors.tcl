IDE::TclModeEdit instproc highligthErrors errors {
    my instvar errorsArr errorNum
    if {![info exists errorNum]} {
        set errorNum 0
    }
    set twin [my getTextWindow]
    set num 0
    set linesErrors [list]
    foreach e $errors {
        set tag e$num
        if {$num == $errorNum} {
            $twin tag configure $tag -background red
            $twin tag raise $tag
            $twin tag bind $tag <Enter> "[self] enterError \[$twin tag names current\]; break"
            $twin tag bind $tag <Leave> "[self] leaveError \[$twin tag names current\]; break"
            incr errorNum
        }
        incr num
        set startIndex [$twin index "1.0 + [lindex $e 0] char"]
        lappend linesErrors [lindex [split $startIndex .] 0] $startIndex $e
        $twin tag add $tag $startIndex "1.0 + [expr {[lindex $e 1]+1}] char"
        set errorsArr($tag) $e
    }
    set lastLine [lindex [split [$twin index end] .] 0]
    my setMarklineErrors $linesErrors $lastLine
}
