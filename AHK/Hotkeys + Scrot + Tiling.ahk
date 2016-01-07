#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

  ;  Winmove, A,,    W,X,Y,Z 
  ; W = Distance from the left most side of your main monitor.
      ; X = Distance from the top of your main monitor.   
  ; Y = The total width of the window.
  ; Z = The total height of the window
  ; Remember to use Windows Spy to help!
  
  ; Top Left
  
  !^NumpadHome::
            WinMove,A,,     1953, 59, 499, 352
  return    


               ; Top
  
  !^NumpadUp::
            WinMove,A,,     2481, 81, 242, 467
      return 

       ; Bottom

  !^NumpadDown::
            WinMove,A,,     2481, 580, 242, 470
      return


      ; Top Right
  
  !^NumpadPgUp::
            WinMove,A,,      3411, 61, 400, 995
      return     
  

  ; Bottom Left     
              
              !^NumpadEnd::
            WinMove,A,,     1951, 695, 500, 358
  return  

              ; Bottom Right

  !^NumpadPgDn::
            WinMove,A,,     2752, 448, 1059, 602
      return

              ; Left

  !^NumpadLeft::
  WinMove,A,,     36, 36, 930, 1015
      return
  

  ; Right

  !^NumpadRight::
            WinMove,A,,     996, 36, 896, 1015
  return


  ; Center (First monitor)

  !^NumpadClear::
            WinMove,A,,     41, 36, 1843, 1014
      return

  ; Nearly fullscreen

  !^F11::
            WinMove,A,,     23, 22, 1877, 1040
      return 

  ; Center (Second monitor)

  !^NumpadEnter::
            WinMove,A,,     1953, 61, 1858, 992
      return

             ; Right (Second Monitor)
             !^NumpadAdd::
            WinMove,A,,     2481, 61, 1330, 992
      return

         ; Middle top

         !^NumpadIns::
          WinMove,A,,     1951, 60, 1432, 995
             return

; Center Alt (First monitor)

  !^NumpadSub::
            WinMove,A,,     84, 96, 1731, 910
      return

; Sublime + Stylish position

  !^NumpadMult::
  WinMove,A,,     1409, 36, 479, 1013
    return

; Firefox position w/ ^

  !^NumpadDiv::
WinMove,A,,     41, 36, 1344, 1013
    return

; Video Player position

  !^F7::
WinMove,A,,     2481, 297, 1327, 753
    return


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Win+A - Open Volume Mixer
#a::
    Run sndvol
    Return

; Win+N - Open Notepad
#n::
    Run Notepad
    Return

; Win+w - Open DualWallpaper
#w::
    Run "C:\Users\Mokocchi\Rice\DualMonitorTools\DualWallpaper.exe"
    Return    

; Win+H - Hide Titlebar (Manual)
    #h::
      WinSet, Style, -0xc00000, A
    return
     
; Win+S - Show Titlebar (Manual)
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
~LButton & RButton::
~RButton & LButton::
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



#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;///Modifiers\\\;
;# = Windows Key;
;! = Alt;        
;^ = Control;
;+ = Shift;
;& = Used to combine keys (ctrl+alt = ^&!);

; /capture=0 takes a screenshot of the whole desktop
; /capture=1 takes a screenshot of the active monitor
; /capture=2 takes a screenshot of the client area of the active window


PrintScreen::
ifnotexist, C:\Users\Mokocchi\Pictures   ; Location Of The Saved Capture
fileCreateDir, C:\Users\Mokocchi\Pictures   ; Location Of The Saved Capture
Run, "C:\Program Files (x86)\IrfanView\i_view32.exe" /capture=0 /convert=C:\Users\Mokocchi\Pictures\Scrot $U(`%d-`%m-`%y` ~ `%H.`%M.`%S).png
return

#PrintScreen::
ifnotexist, C:\Users\Mokocchi\Pictures   ; Location Of The Saved Capture
fileCreateDir, C:\Users\Mokocchi\Pictures   ; Location Of The Saved Capture
Run, "C:\Program Files (x86)\IrfanView\i_view32.exe" /capture=2 /convert=C:\Users\Mokocchi\Pictures\Scrot $U(`%d-`%m-`%y` ~ `%H.`%M.`%S).png
return

!PrintScreen::
ifnotexist, C:\Users\Mokocchi\Pictures   ; Location Of The Saved Capture
fileCreateDir, C:\Users\Mokocchi\Pictures   ; Location Of The Saved Capture
Run, "C:\Program Files (x86)\IrfanView\i_view32.exe" /capture=1 /convert=C:\Users\Mokocchi\Pictures\Scrot $U(`%d-`%m-`%y` ~ `%H.`%M.`%S).png
return