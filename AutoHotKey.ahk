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

; Ctrlを押しながらJを連打する度にArrowLeft
^j::
    Send {Left}
    return

; Ctrlを押しながらIを連打する度にArrowUp
^i::
    Send {Up}
    return

; Ctrlを押しながらLを連打する度にArrowRight
^l::
    Send {Right}
    return

; Ctrlを押しながらKを連打する度にArrowDown
^k::
    Send {Down}
    return

; Ctrl + , でBackspace
^,::
    Send {Backspace}
    return

; Ctrl + U でHome
^u::
    Send {Home}
    return

; Ctrl + O でEnd
^o::
    Send {End}
    return

; Ctrl + Shift + U でShift + Home (行頭まで選択)
^+u::
    Send +{Home}
    return

#If (IsAltTabMenu)
    j::Send {Left}
    k::Send {Down}
    i::Send {Up}
    l::Send {Right}
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
