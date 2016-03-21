RainToggle by Phait

DISCLAIMER AND GENERALS
	This script is free to use and to edit.
	I tested it with a mid-tier pc running Windows 7 and it worked pretty fine, I cannot guarantee it will work anywhere else (though it should run on any Windows after 7).
	Most of all, I am not responsible (nor feel responsible) if this scripts fucks up your settings (though it shouldn't).
	Be sure to make a system restore point before running it, it's good practice anyway. 

	It is designed to be used with Rainmeter 3.1.0 and up, and the main function won't work if it's not called within a Rainmeter skin. 
	Some features of the script rely on NirSoft's NirCmd.exe utility, which you should find is the Resources folder of the skin. 
	I DO NOT OWN this piece of software and you should really go to http://www.nirsoft.net/utils/nircmd.html if you use the skin much, and make a donation.
	The 'toggle' feature of the script uses Winaero's ThemeSwitcher, which you should find is the Resources folder of the skin. 
	Again: I DO NOT OWN this piece of software and you should really go to http://winaero.com/comment.php?comment.news.209 if you use the skin much, and make a donation.

	This script IS free to use and to edit, but it would be nice if you kept in touch with me after making major modifications to it. 
	You can find me at: 
	phait@exsubstantia.com 
	or 
	riceasphait@gmail.com 
	Be sure to visit and share my website, too: http://exsubstantia.com/ and give a dude some credit for his work. 


THANKS TO
	Rooberonska from /wg/ for giving me the idea, the first Rainmeter code, the code to change the bblean theme and the code to change the ffox startpage. 
	NirSoft for making their utility free to use.
	WinAero for making their utility free to use.
	Viola F. for giving me the best music lesson on notes duration in history so that I could make the easter egg. 


HOW TO USE
	Click on the skin, and enter one of the following commands (* next to a command means it's optional to give a parameter, and that the skin will execute the command anyway)


	- run [program]		: will run any [program] that is either specified in the "'RUN' COMMAND CONFIGURATION" section in the script, or is a msDOS command

	- google [query*]	: will google the given query, or open google in the default browser if no query is given

	- url [url*] 		: will open the given url, or open the default browser if no url is given

	- beep [integer*]	: will play the given number of random beeps, or a random number of random beeps if no number is given (also work with 'hi', 'hello', 'sup' and '<3')

	- shot! [filename*]	: will take a screenshot of all connected monitors and save it to the folder specified in the "DEFAULT PATHS CONFIGURATION" section of the script. 
	If [filename] is given, it will save the screenshot as [filename].png, if not it will save it as screenshot-DDMMYY-HHMM.png

	- create [extension]: will create a file with the given extension and save it to the folder specified in the "DEFAULT PATHS CONFIGURATION" section of the script. 
	The file will be saved as newfile-DDMMYY-HHMM.[extension] and will be automatically opened in the default viewer for that extension. 

	- toggle [day/night]: this is the core function of the skin. Based on what values are set to true in the "THEME CHANGER CONFIGURATION" section of the script, it will change various config files and themes to a 'day' profile, or a 'night' one. 
	More information on the confiugration of the command can be found in the script itself, so go look at it before trying the command. 
	Effective on: Windows theme, Windows wallpaper, Bblean theme, Firefox startpage and userchrome.css, Foobar2000 skin and Console2 color config.
	IT IS BUGGY AS HELL, be advised. 
	*****You might also want to close all the programs you are going to toggle (except for bblean and explorer), BEFORE executing the command*****

	- help				: opens this readme


HOW TO CONFIGURE THE TOGGLE COMMAND
	First things first, you need to be using:
		- Windows 7 or later, with Explorer or Bblean as shell
		- Firefox 28.0 and later
		- Foobar2000 with columnsUI as the main wrapper of content 
		- Console2 
	I will assume you know how to rice (at least a bit) all of the items in the list, and that you know your way around the OS.

	When you call the toggle command, the script will do a number of things, depending on the parameters you have set in the "THEME CHANGER CONFIGURATION" section of the script: let's go through them.
	BE CAREFUL: since the execution of the script is a bit layered (lua on top of RM on top of Windows) you need to leave the '' and "" as you find them.
	Also, the backslashes \ should be written as \\, because of how Lua interprets strings. Keep that in mind. 

	The script is able to toggle themes for different programs (let's say it changes the 'profile'), and each program has its set of variables in the config section of the script. 

	The toggle_* variable for each program should be set to true if you want the program to be part of the toggle, false otherwise.

	The path_*Day/Night* variables for each program contain the filesystem path to the config files, to change the relative program's appearence. 
	What will usually happen is that the script will take the given file (let's say day.xml to change Console2's profile to 'day'), will copy it to the folder of the default config file of the program (which in our example is console.xml, in the console installation folder) and will replace the old file with the new, by renaming it.
	A bit confusing, but worry not. What you need to know is that each path is the path to the file you'll want to load for the corresponding day/night profile. 
	That means: 
		- the jpg to set as wallpaper
		- the explorer themes you want to use
		- the bblean themes you want to use
		- the startpage you want to use
		- the userchrome.css you want to use
	And you'll also find:
		- the foobar installation folder
		- the console2 installation folder 

	Some by default will not work because they are tuned to my folder structure and names. Edit them. 


NOTE
	If you followed me until here, I think you'll find it easy to look at the rest of the config section of the script and edit the relevant variables to your needs.
	I won't go through them, as it would be repeating and the section itself is self explanatory. 


KNOWN BUGS
	- Sometimes you have to run 'toggle' twice to see the wallpaper change. It should have been fixed in v1.1, but if your pc is slow in changing the theme, the 2 seconds that the script waits after changing theme before changing the wp won't be enough and you'll have to run the command again. 

	- Running the beep command will cause the windows audio drivers to act weird. 
	You might find that both the integrated speakers of the pc and the headphones aux out will be on at the same time. 
	This is solved by opening the Windows audio mixer and reselecting the 'Speakers and headphones' options for the main device. 
	I don't know why it does this, it just happens. You'll probably won't notice it unless you are on a laptop. 

	-Anything regarding Firefox is not yet implemented <;^)

