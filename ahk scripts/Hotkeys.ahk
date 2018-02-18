#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Modifiers

; # = Windows Key;
; ! = Alt;        
; ^ = Control;
; + = Shift;
; & = Used to combine keys (ctrl+alt = ^&!);


; Script for a bunch of a+ hotkeys idek what I would do w/o.
; There's one to open Volume Mixer, Notepad, Personalization window, Dual Wallpaper, turning the volume up and down, playing and pausing mpc (mpc doesn't need to be active, how gr8), showing and hiding titlebars and moving windows by holding down alt with the left mouse button (basically AltDrag).
; Remove the semicolons in front of line 61 and 62 if you want to be able to move windows by holding down the left and right click buttons, it's a great hotkey but caused problems for me while playing vidyas, so idk use it if you wish.

; Hide taskbar
#T::
if toggle := !toggle
{
WinHide ahk_class Shell_TrayWnd
WinHide Start ahk_class Button
}
else
{
WinShow ahk_class Shell_TrayWnd
WinShow Start ahk_class Button
}
return

; Win+A - Open Volume Mixer
#a::
    Run sndvol
    Return

; Ctrl+Alt+P - Open Personalization menu
^!p::
    Run "::{26EE0668-A00A-44D7-9371-BEB064C98683}\1\::{ED834ED6-4B5A-4BFE-8F11-A626DCB6A921}"
    Return

; Ctrl+Alt+C - Open Control Panel
^!C::
    Run "::{26EE0668-A00A-44D7-9371-BEB064C98683}"
    Return

; Win+N - Open Notepad
#n::
    Run Notepad
    Return


; Win+N - Open Notepad TEST
;#n::

;    Run Notepad
;    Run sndvol
;    Return


; Win+w - Open DualWallpaper
#w::
    Run "E:\Programs\DualMonitor\DualWallpaper.exe"
    Return    


; Win+H - Hide Titlebar
    #h::
      WinSet, Style, -0xc00000, A
    return
     

; Win+S - Show Titlebar
    #s:: 
      WinSet, Style, +0xc00000, A
    return


 ; Ctrl+Up - Turn volume up 
     ^Up::
     SoundSet +5
     Return    


; Ctrl+Down - Turn volume down
      ^Down::
     SoundSet -5
     Return 


; F7 to play/pause MPC-HC
F7::
    SendMessage,0x0111,889,,,ahk_class MediaPlayerClassicW  
Return     


; Move windows using Alt and left click (altdrag replacement), and left and right click together
;~LButton & RButton::
;~RButton & LButton::
!LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized 
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return

