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



; Tiling script for a single monitor at 1920x1080
; Open Windows Spy (right click AHK in tray) to help if you want to adjust it
; Nearly all of it is Ctrl + Alt + Numpad number
; Make sure numlock is turned off

  

            ; Left side window  -  Ctrl+Alt+7
    !^NumpadHome::
WinMove,A,,     19, 22, 816, 1015
    return


          ; Left Top - Ctrl+Alt+Left arrow

  !^NumpadLeft::
  WinMove,A,,     19, 23, 816, 826
      return    


; Right - Ctrl+Alt+Right arrow

  !^NumpadRight::
            WinMove,A,,     841, 23, 584, 826
  return


          ; Left Bottom - Ctrl+Alt+1

  !^NumpadEnd::
  WinMove,A,,     19, 544, 816, 493
      return 


           ; Middle - Ctrl+Alt+Up arrow

  !^NumpadUp::
  WinMove,A,,     840, 22, 816, 1015
      return
  

           ; Side windows - Steam - Ctrl+Alt+9 and 10

!^NumpadPgup::
            WinMove,A,,     1669, 22, 230, 485
  return

!^NumpadPgdn::
            WinMove,A,,     1669, 530, 230, 500
  return



        ; Center - Ctrl+Alt+5

  !^NumpadClear::
            WinMove,A,,      17, 22, 1408, 829
      return



        ; Center Alt - Ctrl+Alt+-

  !^NumpadSub::
            WinMove,A,,     201, 128, 1494, 849
      return



           ; Sublime + Stylish position - Ctrl+Alt+*

  !^NumpadMult::
  WinMove,A,,     1409, 36, 479, 1013
    return



          ; Video Player position - Ctrl+Alt+F7

  !^F7::
WinMove,A,,      310, 253, 944, 564
    return


