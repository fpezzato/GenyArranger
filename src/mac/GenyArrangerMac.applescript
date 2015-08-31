--V0.0.2 -  https://github.com/fpezzato/GenyArranger/

property MAX_COLUMN_NUMBER : 2
property PLAYER_WIDTH : 250
property PLAYER_HEIGHT : 400


set rowCounter to 0
set columCounter to 0

set TOP_LEFT_MSG to "Start from top-left"
set TOP_RIGHT_MSG to "Start from top-right"

set positionPreference to choose from list {TOP_LEFT_MSG, TOP_RIGHT_MSG} with title "Pick gravity" with prompt "Choose the gravity" default items TOP_LEFT_MSG

if positionPreference is not false then
	
	tell application "System Events"
		repeat with p in (processes where background only is false and name is "player")
			
			if positionPreference is in {TOP_LEFT_MSG} then
				my placeTopLeft(p)
			else
				my placeTopRight
			end if
			
			
		end repeat
	end tell
end if

on placeTopLeft(p)
	log p
	set rowCounter to 0
	set columCounter to 0
	tell p
		set position of windows to {columCounter * PLAYER_WIDTH, rowCounter * PLAYER_HEIGHT}
		set size of windows to {PLAYER_WIDTH, PLAYER_HEIGHT}
		if columCounter is greater than MAX_COLUMN_NUMBER then
			set columCounter to 0
			set rowCounter to rowCounter + 1
		else
			set columCounter to columCounter + 1
		end if
	end tell
	
end placeTopLeft

on placeTopRight()
	set position of windows to {columCounter * PLAYER_WIDTH, rowCounter * PLAYER_HEIGHT}
	set size of windows to {PLAYER_WIDTH, PLAYER_HEIGHT}
	if columCounter is greater than MAX_COLUMN_NUMBER then
		set columCounter to 0
		set rowCounter to rowCounter + 1
	else
		set columCounter to columCounter + 1
	end if
	
end placeTopRight