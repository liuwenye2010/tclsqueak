IDE::MethodListView instproc searchImplementors current {
    set method [lindex [split $current >] 1]
    [my getViewMaster] showSearchResult [IDE::CodeSearch search [dict create text $method scope all type implementors]]
}
