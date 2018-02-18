#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Uncomment this if you want a hotkey to set it for every
; !+r::GoSub, AdjustAllWindows

; Initalise the hook
GoSub, HookWindow
; Run it once for every window
GoSub, AdjustAllWindows
Return

HookWindow:
    ; New Window Hook
    Gui +LastFound
    hWnd := WinExist()

    DllCall( "RegisterShellHookWindow", UInt,hWnd )
    MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
    OnMessage( MsgNum, "ShellMessage" )

    ShellMessage(wParam,lParam) {
        If (wParam = 1) ;  HSHELL_WINDOWCREATED := 1
        {
            Sleep, 10
            AdjustWindow(lParam)
        }
    }
Return

; Adjust Window
AdjustWindow(id)
{
    WinId := id
    WinTitle := id = "A" ? "A" : "ahk_id " . id

    ; Uncomment this and comment the above if you don't want it to work on every window
    WinSet, Style, -0xC00000, %WinTitle%
}

AdjustAllWindows:
    WinGet, id, list,,, Program Manager
    Loop, %id%
    {
        AdjustWindow(id%A_Index%)
    }
Return