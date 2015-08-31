--V0.0.2 -  https://github.com/fpezzato/GenyArranger/

set MAX_COLUMN_NUMBER to 2

set rowCounter to 0
set columCounter to 0


tell application "System Events"
	repeat with p in (processes where background only is false)
		tell p
			if name is "player" then
				
				set position of windows to {columCounter * 300, rowCounter * 300}
				set size of windows to {300, 300}
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