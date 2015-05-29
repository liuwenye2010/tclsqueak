IDE::CompBrowser instproc browseString string {
    set introProxy [IDE::XOIntroProxy getIntroProxyForObject $string]
    if {$introProxy ne ""} {
        if {[$introProxy isObjectClass $string]} {
            set component [$introProxy getComponentNameForObject $string]
            [self]::@codecontroller setBodyText $string [$introProxy getMethodTypePrefix]Def $component
        } else {
            if {[$introProxy isRootClass [$introProxy getClassForObject $string]]} {
                set component [$introProxy getComponentNameForObject $string]
                if {$component ne "default"} {
                    [self]::@codecontroller setBodyText $string [$introProxy getMethodTypePrefix]Def $component
                } else {
                    IDE::ObjectBrowser newBrowser $string $introProxy
                }
            } else {
                IDE::ObjectBrowser newBrowser $string $introProxy
            }
        }
    } else {
        if {[IDE::System tryBrowseAsObjectList $string]} return
        set result [IDE::CodeSearch search [dict create text $string type implementors scope all]]
        if {[llength [dict get $result result]]>0} {
            my showSearchResult $result
        }
    }
}
