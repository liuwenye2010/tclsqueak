IDE::HeritageBrowser instproc closeWindow {} {
    if {[[self]::methodedit askForModification]} {
        next
    }
}
