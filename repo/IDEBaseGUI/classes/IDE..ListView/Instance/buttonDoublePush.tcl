IDE::ListView instproc buttonDoublePush {} {
    my instvar win selectedIndex listItems
    set currsel [lindex [$win.listbox curselection] 0]
    if {$currsel ne ""} {
        my selectItem [lindex $listItems $currsel]
    }
}
