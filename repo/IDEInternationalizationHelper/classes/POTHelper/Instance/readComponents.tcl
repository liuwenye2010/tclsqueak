POTHelper instproc readComponents {} {
   [self]::components setList [IDE::IntroProxy getComponents]
}
