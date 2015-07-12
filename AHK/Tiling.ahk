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
            WinMove,A,,     1955, 59, 441, 448
	return		


               ; Top
	
	!^NumpadUp::
            WinMove,A,,     2427, 59, 426, 448
    	return 


    	; Top Right
	
	!^NumpadPgUp::
            WinMove,A,,     2886, 59, 924, 531
    	return
	

	; Bottom Left			
              
              !^NumpadEnd::
            WinMove,A,,     1955, 533, 898, 519
	return	


              ; Bottom Right

	!^NumpadPgdn::
            WinMove,A,,     2886, 616, 924, 437
    	return


              ; Left

	!^NumpadLeft::
	WinMove,A,,     36, 59, 919, 993
    	return
	

	; Right

	!^NumpadRight::
            WinMove,A,,     990, 59, 898, 993
    	return


	; Center (First monitor)

	!^NumpadClear::
            WinMove,A,,     36, 59, 1852, 993
    	return

	; Center (Second monitor)

	!^NumpadEnter::
            WinMove,A,,     1954, 59, 1854, 993
    	return

             ; Right (Second Monitor)
             !^NumpadAdd::
            WinMove,A,,     2886, 59, 924, 993
    	return

