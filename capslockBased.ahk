#NoTrayIcon

SetCapsLockState, AlwaysOff
;capsMode = 1


; ------------------------
;	Windows Management
; ------------------------


CapsLock & q::Send !{F4}
CapsLock & w::Send ^{F4}
;^+SPACE::  Winset, Alwaysontop, , A 	;set windows allways on top
CapsLock & ]::Send #^{Right}
CapsLock & [::Send #^{Left}


; Press ~ to move up a folder in Explorer
#IfWinActive, ahk_class CabinetWClass
`::Send !{Up}
#IfWinActive
return



; ------------------------
;			Arrows
; ------------------------
Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}
Capslock & k::Send {Blind}{Up DownTemp}
Capslock & k up::Send {Blind}{Up Up}
Capslock & h::Send {Blind}{Left DownTemp}
Capslock & h up::Send {Blind}{Left Up}
Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}


Capslock & Tab::Send {Esc}

; ------------------------
;		Scrolls
; ------------------------

CapsLock & i::Send {PgUp}
CapsLock & o::Send {PgDn}

Capslock & u::
If GetKeyState("Shift","p")
 Send +{Home}
else
 Send {Home}
Return

Capslock & p::
If GetKeyState("Shift","p")
 Send +{End}
else
 Send {End}
Return

; ------------------------
;		Text Edit
; ------------------------
Capslock & y::Send {Blind}{Backspace DownTemp}
Capslock & y up::Send {Blind}{Backspace Up}
Capslock & m::Send {Blind}{Del DownTemp}
Capslock & m up::Send {Blind}{Del Up}


; ------------------------
;		Search
; ------------------------

	; Windows
;Capslock & Insert :: Send documents:

#+s::
    {
	Send, #s
	;Sleep 50
	SendInput, documents:
	Return
    }

	; Search Google from any app
#+c::
    {
	Send, ^c
	Sleep 50
	Run, http://www.google.com/search?q=%clipboard%
	Return
    }

; ------------------------
;		Open CMD from Explorer on current folder
; ------------------------

#C::
{
    Send !D
    Send CMD
    Send {Enter}
    return
}

; ------------------------
; 			Skype
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

; ------------------------
; 		Media Keys
; ------------------------

	; Next song
Capslock & 1::Send {Blind}{Media_Prev DownTemp}
Capslock & 1 up::Send {Blind}{Media_Prev Up}

	; Play/Pause
Capslock & 2::Send {Blind}{Media_Play_Pause DownTemp}
Capslock & 2 up::Send {Blind}{Media_Play_Pause Up}

	; Previous Song
Capslock & 3::Send {Blind}{Media_Next DownTemp}
Capslock & 3 up::Send {Blind}{Media_Next Up}


	; Mute
Capslock & F1::Send {Volume_Mute}

	; Volume Down
Capslock & F2::Send {Volume_Down}

	; Volume Up
Capslock & F3::Send {Volume_Up}


; ------------------------
; 		Multikeypress
; ------------------------


; Keypress detection for Capslock.
;Capslock::
;if counter >= 0 ; setTimer already started, so we log the keypress instead
;{
;	counter++
;	return
;}
;counter = 0 ; Start setTimer and set the number of logged keypresses to 0
;setTimer,keyWinC, 400
;return

;keyWinC:
;setTimer,keyWinC,off
;if counter = 0 ; The key is pressed once
;{

;}
;if counter = 1 ; The key is pressed twice
;{
;	global capsMode = 11
	;Send {Esc}
	;SetCapsLockState, AlwaysOn

;}
;if counter = 2 ; The key is pressed thrice
;{
;	global capsMode = 1
;	Send d
	;SetCapsLockState, AlwaysOff

;}
;counter = -1
;return


; ------------------------
; 		Chrome
; ------------------------

; ignore ctrl+w in chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1
^w::return
#IfWinActive
return
