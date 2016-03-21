--toggle.lua by Phait

--[[DISCLAIMER
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



CONFIGURATION SECTION
CONFIGURATION SECTION
CONFIGURATION SECTION
CONFIGURATION SECTION
CONFIGURATION SECTION
CONFIGURATION SECTION
CONFIGURATION SECTION
CONFIGURATION SECTION
CONFIGURATION SECTION
Backslashes must be written as '\\' when between apexes, leave it like that or it won't work.
Strings for the script are enclosed between apexes '' and windows commands are enclosed between quotes "" leave it like that or it probably won't work



THEME CHANGER CONFIGURATION
If the value of the toggle_* variable is true, the script will change the config for that program
Leave the "" and '' as they are. Do not fuck them up!
]]
toggle_Meter=true
colorDay_Meter='"0,0,0"' 			--font color for the day config of the meter
backgroundDay_Meter='"b9b9b9"' --background color for the day config of the meter
colorNight_Meter='"556b82"' 	--font color for the night config of the meterb
backgroundNight_Meter='"1d1e2a"' 	--background color for the night config of the meter

toggle_Wallpaper=true
path_WallpaperDay='"WP\\Day.png"' 
path_WallpaperNight='"WP\\Night.png"'
option_Wallpaper='Fill' --how to display the wallpaper: Center, Tile, Stretch, Fit and Fill are the possible options

toggle_WindowsTheme=true 
name_WindowsDayTheme='"C:\\Windows\\Resources\\Themes\\Neutral.theme"'
name_WindowsNightTheme='"C:\\Windows\\Resources\\Themes\\Nocturnal.theme"'

toggle_BbleanTheme=false --still have to test it out
path_BbleanDayTheme='"C:\\bbLean\\styles\\3colours\\red"'
path_BbleanNightTheme='"C:\\bbLean\\styles\\3colours\\blue"'

toggle_FirefoxUserchrome=false --working on it... while I figure it out, simply have two .css files and switch them manually with Stylish
path_FirefoxUserchrome=''

toggle_FirefoxStartpage=false --already figured out but I was lazy and I didn't implement it... 
path_FirefoxStartpage=''

toggle_Foobar2000=false --This is buggy as hell and it only works if you use columns ui to wrap everything (e.g. if you use my config for foobar (http://exsubstantia.com/ricing) it will work)
path_Foobar2000='"%APPDATA%\\foobar2000\\' --Path to the foobar installation folder
path_Foobar2000DayTheme='"%APPDATA%\\foobar2000\\theme\\day.cfg"' 					
path_Foobar2000NightTheme='"%APPDATA%\\foobar2000\\theme\\night.cfg"' 				
																																																																							
toggle_Console2=false
path_Console2='"%userprofile%\\NC\\Console2\\' --path to the console2 installation folder			
path_Console2DayTheme='"%userprofile%\\NC\\Console2\\theme\\day.xml"'	
path_Console2NightTheme='"%userprofile%\\NC\\Console2\\theme\\night.xml"'	

--[[
DEFAULT PATHS CONFIGURATION
Again: leave the "" and '' as they are. DO NOT FUCK THEM UP!
]]
browser='"C:\\Program Files (x86)\\Mozilla Firefox\\firefox.exe"' 	-- the url and google commands will execute in the browser specified here, leave the '""' as they are if you change the path
bblean='"C:\\bbLean\\blackbox.exe"' 								-- path to the bblean executable
screenshot='"%userprofile%\\Pictures\\' 							-- the shot! command will save the screenshot in this folder
newfile='"%userprofile%\\'											-- the create command will save the files here

--[[
'RUN' COMMAND CONFIGURATION
typing 'run [item_name]' in the script will run item_path.
Remember: the association between name and path is positional, so don't mess up the order of the arrays.
I know, it's ugly as sin and bad programming practice and doesn't use lua's tables properly: sue me ;^)
]]
item_name={
'firefox', --1
'foobar', --2
'console', --3
'notepad', --4
'explorer', --5
'', --6
'', --7
'', --8
'', --9
'', --10
'', --11
'', --12
}
item_path={
'"C:\\Program Files (x86)\\Mozilla Firefox\\firefox.exe"', --1
'"C:\\Program Files (x86)\\foobar2000\\foobar2000.exe"', --2
'"C:\\Users\\Phait\\NC\\Console2\\Console.exe"', --3
'"C:\\Program Files (x86)\\Notepad++\\notepad++.exe"', --4
'"explorer.exe"', --5
'', --6
'', --7
'', --8
'', --9
'', --10
'', --11
'', --12
} 

--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--
--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--
--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--
--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--
--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--
--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--
--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--
--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--
--END CONFIG SECTION: NO NEED TO EDIT AFTER THIS POINT--

function ka_bang(stringToSplit)
	local item=""
	local a=""
	local i=0
	local cmd=""

	path_Foobar2000=path_Foobar2000..'configuration\\foo_ui_columns.dll.cfg"'
	path_Console2=path_Console2..'console.xml"' 

	repeat	--scans the strings and puts the first word in cmd
		cmd=cmd..a
		a = string.sub(stringToSplit,i+1, i+1)
		i=i+1
	until a==" " or i==string.len(stringToSplit)+1 

	if a==' ' then 
		item = string.gsub(stringToSplit, cmd..' ', "",1)  -- gets the argument of the command, whenever a string is passed after a cmd
	else 
		item = string.gsub(stringToSplit, cmd, "",1)  -- special treatment for single command inputs with no args
	end

--run a program
	if cmd=="run" then 
		for i=1, table.getn(item_name), 1 do
			if item==item_name[i] then 
				item=item_path[i] 
				break
			end
		end
		SKIN:Bang(item)
		return
--google something (if no query is given simply open google in the default browser)
	elseif cmd=="google" then 
		item=string.gsub(item," ","+")
		item="https://www.google.com/search?q="..item
		SKIN:Bang(browser..' '..item)
		return
--open url (no argument simply opens browser)
	elseif cmd=="url" then 
		SKIN:Bang(browser..' '..item)
		return
--play a specified number of random beeps, or a random one if no preference is given
	elseif cmd=="hi" or cmd=="hello" or cmd=="beep" or cmd=="sup" or cmd=='<3' then 
		local var=0
		if os.date('%m')=='12' or item=='xmas' then --yay you found the easter egg... good luck making it play more than 10 notes tho
			local freq={'1047','932','880','784','698','784','880','698'}
			local duration={'750','250','500','500','500','500','500','500'}
			for i=1,8,1 do
				SKIN:Bang('#@#nircmd.exe beep '..freq[i]..' '..duration[i])
			end
			return
		end
		if item~='' then 
			var=tonumber(item)
		else
			var=math.random(3,10)
		end	
		for i=1,5,1 do
			SKIN:Bang('#@#nircmd.exe beep '..tostring(math.random(500,1600))..' '..tostring(math.random(100,500)))
		end
		return
--take a screenshot of all monitors and saves it to userprofile\Pictures floder, it's possbile to specifiy a name for the file too
	elseif cmd=='shot!' or cmd=='shot' then --there, I made it so you don't have to remember the ! everytime 
		if item~='' then 
			item=item..'.png"'
		else
			item=os.date('screenshot-%d%m%Y-%H%M.png"')
		end
		SKIN:Bang('#@#nircmd.exe savescreenshotfull '..screenshot..item)
		return
--creates a file in the default folder with the specified extension
	elseif cmd=='create' then
		SKIN:Bang('#@#nircmd.exe execmd type nul > '..newfile..os.date('newfile-%d%m%Y-%H%M')..'.'..item..'"')
		SKIN:Bang('#@#nircmd.exe execmd '..newfile..os.date('newfile-%d%m%Y-%H%M')..'.'..item..'"')
				return
--toggle between a day and a night configuration
	elseif cmd=='toggle' then		
		if toggle_Meter then --changes meter's background and font color
			if item == 'day' then
				SKIN:Bang('!WriteKeyValue Variables background '..backgroundDay_Meter)
				SKIN:Bang('!WriteKeyValue Variables color  '..colorDay_Meter)
			elseif item == 'night' then
				SKIN:Bang('!WriteKeyValue Variables background  '..backgroundNight_Meter)
				SKIN:Bang('!WriteKeyValue Variables color  '..colorNight_Meter)
			end
		end
		if toggle_WindowsTheme then
			if item == 'day' then 
				SKIN:Bang('#@#ThemeSwitcher.exe '..name_WindowsDayTheme)
			elseif item == 'night' then 
				SKIN:Bang('#@#ThemeSwitcher.exe '..name_WindowsNightTheme)
			end
		end
		os.execute("timeout 3") --leave this here, otherwise it will mess up the wp change
		if toggle_BbleanTheme then	
			if item=='day' then 
				SKIN:Bang(bblean..' -exec @BBCore.style '..path_BbleanDayTheme)
			elseif item == 'night' then
				SKIN:Bang(bblean..' -exec @BBCore.style '..path_BbleanNightTheme)
			end
			SKIN:Bang(bblean..' -exec @BBCore.restart')
		end
		if toggle_Foobar2000 then
			if item == 'day' then
				SKIN:Bang('#@#nircmd.exe execmd copy '..path_Foobar2000DayTheme..' '..path_Foobar2000..' /y')
			elseif item == 'night' then
				SKIN:Bang('#@#nircmd.exe execmd copy '..path_Foobar2000NightTheme..' '..path_Foobar2000..' /y')
			end
		end
		if toggle_Console2 then
			if item == 'day' then
				SKIN:Bang('#@#nircmd.exe execmd copy '..path_Console2DayTheme..' '..path_Console2..' /y')
			elseif item == 'night' then
				SKIN:Bang('#@#nircmd.exe execmd copy '..path_Console2NightTheme..' '..path_Console2..' /y')
			end	
		end
		if toggle_Wallpaper then --changes wallpaper
			if item == 'day' then
				SKIN:Bang('!SetWallpaper '..path_WallpaperDay..' '..option_Wallpaper)
			elseif item == 'night' then
				SKIN:Bang('!SetWallpaper '..path_WallpaperNight..' '..option_Wallpaper)
			end
		end
		SKIN:Bang('!Refresh')
		return
--opens phait's site <3
	elseif cmd=='phait' or cmd=='phait' then 
		item="http://exsubstantia.com/"
		SKIN:Bang(browser..' '..item)
		return
--opens tumblr
	elseif cmd=='tumblr' or cmd=='tmblr' then 
		item="http://tumblr.com"
		SKIN:Bang(browser..' '..item)
		return	
--opens moko's site
	elseif cmd=='moko' or cmd=='moko' then 
		item="http://mokocchi.cf"
		SKIN:Bang(browser..' '..item)
		return		
--opens /w/ destap
	elseif cmd=='/w/' or cmd=='/w/' then 
		item="http://boards.4chan.org/w/#s=desktop"
		SKIN:Bang(browser..' '..item)
		return				
--open readme.txt in the default text editor
	elseif cmd=='help' then 
		SKIN:Bang('#@#readme.txt')
		return
	end
end