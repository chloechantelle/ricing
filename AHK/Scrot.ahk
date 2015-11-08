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
; /capture=1 takes a screenshot of the active window
; /capture=2 takes a screenshot of the client area of the active window


PrintScreen::
ifnotexist, C:\Users\USERNAME\Pictures   ; Location Of The Saved Capture
fileCreateDir, C:\Users\USERNAME\Pictures   ; Location Of The Saved Capture
Run, "C:\Program Files (x86)\IrfanView\i_view32.exe" /capture=0 /convert=C:\Users\USERNAME\Pictures\Scrot $U(`%d-`%m-`%y` ~ `%H.`%M.`%S).png
return

!PrintScreen::
ifnotexist, C:\Users\USERNAME\Pictures   ; Location Of The Saved Capture
fileCreateDir, C:\Users\USERNAME\Pictures   ; Location Of The Saved Capture
Run, "C:\Program Files (x86)\IrfanView\i_view32.exe" /capture=2 /convert=C:\Users\USERNAME\Pictures\SS_$U(`%d-`%m-`%y`).png
return

#PrintScreen::
ifnotexist, C:\Users\USERNAME\Pictures   ; Location Of The Saved Capture
fileCreateDir, C:\Users\USERNAME\Pictures   ; Location Of The Saved Capture
Run, "C:\Program Files (x86)\IrfanView\i_view32.exe" /capture=1 /convert=C:\Users\USERNAME\Pictures\SS_$U(`%Y-`%m-`%d_`%S).png
return