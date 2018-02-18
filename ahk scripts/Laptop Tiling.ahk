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


  ;  Winmove, A,,    W,X,Y,Z 
  ; W = Distance from the left most side of your main monitor.
      ; X = Distance from the top of your main monitor.   
  ; Y = The total width of the window.
  ; Z = The total height of the window
  ; Remember to use Windows Spy to help!



; Tiling script for a laptop (1366x768)

; Open Windows Spy (right click AHK in tray) to help if you want to adjust it
; Nearly all of it is Ctrl + Alt + Numpad number
; Make sure numlock is turned off

 

  ; Left - Ctrl+Alt+Left arrow

   !^NumpadLeft::
   WinMove,A,,      20, 19, 687, 706
   return    



; Right - Ctrl+Alt+Right arrow

	!^NumpadRight::
	WinMove,A,,     714, 19, 640, 706
	return



; Left Bottom - Ctrl+Alt+1

  !^NumpadEnd::
  WinMove,A,,     20, 382, 687, 343
  return 



; Top left - Ctrl+Alt+7
	!^NumpadHome::
	WinMove,A,,   20, 19, 687, 351
	return



; Top right - Ctrl+Alt+9

   !^NumpadPgup::
   WinMove,A,,     714, 19, 640, 351
   return



; Bottom right - Ctrl+Alt+3

  !^NumpadPgdn::
  WinMove,A,,     714, 384, 640, 341
  return


; Top - Ctrl+Alt+8

!^NumpadUp::
WinMove,A,,    20, 19, 905, 706
return


; Center - Ctrl+Alt+5

  !^NumpadClear::
  WinMove,A,,      20, 19, 1334, 705
  return