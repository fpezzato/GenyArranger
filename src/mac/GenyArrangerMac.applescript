--V0.0.2 -  https://github.com/fpezzato/GenyArranger/

set MAX_COLUMN_NUMBER to 2
set PLAYER_WIDTH to 250
set PLAYER_HEIGHT to 400


set rowCounter to 0
set columCounter to 0


tell application "System Events"
	repeat with p in (processes where background only is false)
		tell p
			if name is "player" then
				
				set position of windows to {columCounter * PLAYER_WIDTH, rowCounter * PLAYER_HEIGHT}
				set size of windows to {PLAYER_WIDTH, PLAYER_HEIGHT}
				if columCounter is greater than MAX_COLUMN_NUMBER then
					set columCounter to 0
					set rowCounter to rowCounter + 1
				else
					set columCounter to columCounter + 1
				end if
				
			end if
		end tell
	end repeat
end tell