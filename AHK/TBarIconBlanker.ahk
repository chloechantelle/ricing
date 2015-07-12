/*
Author:  Jody Holmes (Skwire)
Date:    2009-08-23
Contact: skwire@skwire.net


v0.0.0.3 - 2009-09-29
    + Added optional showing/hiding of titlebar min/max/close buttons.

v0.0.0.2 - 2009-08-28
    * Hook now fires on two additional messages.
        HSHELL_REDRAW
        HSHELL_RUDEAPPACTIVATED

v0.0.0.1 - 2009-08-23
    + Initial build.

*/

#NoTrayIcon
#Persistent
#NoEnv
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
DetectHiddenWindows, Off
OnExit, Cleanup
SysGet, TBarHeight, 4

Menu, Tray, NoStandard
Menu, Tray, Add, Exit, Cleanup

Gui +LastFound
hWnd := WinExist()

; Hook the shell.
; http://www.autohotkey.com/forum/viewtopic.php?p=123323#123323
DllCall( "RegisterShellHookWindow", UInt, hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str, "SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )

; Create a blank cursor for use instead of a blank icon file.
; http://www.autohotkey.com/forum/viewtopic.php?p=220113#220113
VarSetCapacity( AndMask, 32*4, 0xFF ), VarSetCapacity( XorMask, 32*4, 0 )
hIcon := DllCall( "CreateCursor", Uint, 0, Int, 0, Int, 0, Int, 32, Int, 32, Uint, &AndMask, Uint, &XorMask )

; Initial loop to blank out existing windows.
WinGet, s, List
Loop, % s
{
    s := s%A_Index%
    ;SendMessage, 0x80, 0, hIcon, , % "ahk_id " . s
}

; MsgBox, 36, TBarIconBlanker, Would you like to enable the min/max/close buttons tweak as well?
; IfMsgBox, Yes
; {
;     MinMaxCloseOption := 1
;     SetTimer, WatchCursor, 100
; }
;MinMaxCloseOption := 1
;SetTimer, WatchCursor, 100

Return ; End of auto-execute section.


; ------------------------------------------------------------------------
; Subroutines ------------------------------------------------------------
; ------------------------------------------------------------------------

Cleanup:
{
    If ( MinMaxCloseOption = 1 ) ; Restore titlebar buttons on close.
    {
        WinGet, s, List
        Loop, % s
        {
            s := s%A_Index%
            WinSet, Style, +0x80000, % "ahk_id " . s ; Restore min/max/close buttons.
        }
    }
    ExitApp
}
Return


WatchCursor:
{
    MouseGetPos, , yPos, CurrID,
    If ( yPos >= 0 and yPos < ( TBarHeight + 3 ) )
    {
        WinSet, Style, +0x80000, % "ahk_id " . CurrID ; Restore min/max/close buttons.
        SendMessage, 0x80, 0, hIcon, , % "ahk_id " . CurrID ; Blank out titlebar and taskbar icons.
    }
    Else
    {
        WinSet, Style, -0x80000, % "ahk_id " . PrevID ; Get rid of min/max/close buttons.
        WinSet, Style, -0x80000, % "ahk_id " . CurrID ; Get rid of min/max/close buttons.
        SendMessage, 0x80, 0, hIcon, , % "ahk_id " . CurrID ; Blank out titlebar and taskbar icons.
    }
}
Return


; ------------------------------------------------------------------------
; Functions --------------------------------------------------------------
; ------------------------------------------------------------------------

; Shell hook to blank out windows that are subsequently created.
ShellMessage( wParam, lParam )
{
    Global hIcon, MinMaxCloseOption, PrevID
    If wParam in 1,6,32772
    {
        SendMessage, 0x80, 0, hIcon, , % "ahk_id " . lParam ; Blank out titlebar and taskbar icons.
        If ( MinMaxCloseOption = 1 )
        {
            WinSet, Style, -0x80000, % "ahk_id " . lParam ; Get rid of min/max/close buttons.
        }
    }
    PrevID := lParam
}
