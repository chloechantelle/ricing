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
            WinMove,A,,     1952, 73, 442, 285
	return		


               ; Top
	
	!^NumpadUp::
            WinMove,A,,     2428, 73, 248, 483
    	return 

       ; Bottom

	!^NumpadDown::
            WinMove,A,,     2428, 591, 248, 458
    	return


    	; Top Right
	
	!^NumpadPgUp::
            WinMove,A,,      3407, 73, 400, 976
    	return     
	

	; Bottom Left			
              
              !^NumpadEnd::
            WinMove,A,,     1952, 660, 443, 389
	return	

              ; Bottom Right

	!^NumpadPgDn::
            WinMove,A,,     2712, 73, 1097, 976
    	return

         ; Middle top

         !^NumpadIns::
          WinMove,A,,     2712, 73, 660, 976
             return


              ; Left

	!^NumpadLeft::
	WinMove,A,,     36, 63, 927, 988
    	return
	

	; Right

	!^NumpadRight::
            WinMove,A,,     996, 63, 896, 989   
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
            WinMove,A,,     1952, 73, 1852, 976
    	return

             ; Right (Second Monitor)
             !^NumpadAdd::
            WinMove,A,,     2426, 73, 1384, 976
    	return

; Center Alt (First monitor)

	!^NumpadSub::
            WinMove,A,,     84, 96, 1731, 910
    	return

; Sublime + Stylish position

  !^NumpadMult::
  WinMove,A,,     1440, 73, 448, 976
    return

; Firefox position w/ ^

  !^NumpadDiv::
WinMove,A,,     41, 73, 1364, 976
    return

; Video Player position

  !^F7::
WinMove,A,,     2712, 256, 1095, 623
    return