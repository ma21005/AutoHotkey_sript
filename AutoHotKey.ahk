; Ctrl 2連打でAlt + Tabキーになるように割り当て
; タスク切り替えが表示されている間vim風の割り当て
IsAltTabMenu := false
!Tab::
    Send !^{Tab}
    IsAltTabMenu := true
    return
Ctrl::
    If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 1000){
        Send !^{Tab}
        IsAltTabMenu := true
    }
    return
#If (IsAltTabMenu)
    j::Send {Left}
    l::Send {Right}
    i::Send {Up}
    k::Send {Down}
    Enter::
        Send {Enter}
        IsAltTabMenu := false
    Return
    Space::
        Send {Space}
        IsAltTabMenu := false
    Return
#If

; Shift 2連打でAlt + ←キーになるように割り当て
Shift::
    If (A_PriorHotKey == A_ThisHotKey and A_TimeSincePriorHotkey < 1000){
        Send, !{Left}
    }
    return
