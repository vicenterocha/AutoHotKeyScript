#NoTrayIcon

SetCapsLockState, AlwaysOff

; Windows Management
CapsLock & q::Send !{F4}
CapsLock & w::Send ^{F4}
^+SPACE::  Winset, Alwaysontop, , A 	;set windows allways on top
CapsLock & ]::Send #^{Right}
CapsLock & [::Send #^{Left}


; Press ~ to move up a folder in Explorer
#IfWinActive, ahk_class CabinetWClass
`::Send !{Up} 
#IfWinActive
return

; ARROWS
Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}
Capslock & k::Send {Blind}{Up DownTemp}
Capslock & k up::Send {Blind}{Up Up}
Capslock & h::Send {Blind}{Left DownTemp}
Capslock & h up::Send {Blind}{Left Up}
Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}

; Scrolls
CapsLock & i::Send {PgUp}
CapsLock & o::Send {PgDn}
CapsLock & u::Send {Home}
CapsLock & p::Send {End}

; TextEdit
Capslock & y::Send {Blind}{Backspace DownTemp}
Capslock & y up::Send {Blind}{Backspace Up}
Capslock & m::Send {Blind}{Del DownTemp}
Capslock & m up::Send {Blind}{Del Up}

; Windows search
;Capslock & Insert :: Send documents:

#+s::
    {
	Send, #s
	;Sleep 50
	SendInput, documents: 
	Return
    }

;Search Google from any app
#+c::
    {
	Send, ^c
	Sleep 50
	Run, http://www.google.com/search?q=%clipboard%
	Return
    }

; Custom volume buttons
CapsLock & NumpadAdd:: Send {Volume_Up} ;shift + numpad plus
NumpadAdd & NumpadSub:: Send {Volume_Down} ;shift + numpad minus
;break::Send {Volume_Mute} ; Break key mutes
return

#C::
{
    Send !D
    Send CMD
    Send {Enter}    
    return
}

; ------------------------
; 			Skype (not active)
; ------------------------

ConversationUp()
{
    Send, {AltDown}2{AltUp}
    Sleep, 100
    Send, {Up}{Enter}
    return
}

ConversationDown()
{
    Send, {AltDown}2{AltUp}
    Sleep, 100
    Send, {Down}{Enter}
    return
}


;Ctrl+Down move one conversation down
;^Down::ConversationDown()

;Ctrl+Up move one conversation up
;^Up::ConversationUp()
