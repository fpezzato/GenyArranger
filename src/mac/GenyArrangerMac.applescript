--V0.0.1
set counter to 0
tell application "System Events"
	repeat with p in (processes where background only is false)
		tell p
			if name is "player" then
				
				set position of windows to {counter * 300, 0}
				set size of windows to {300, 300}
				
				set counter to counter + 1
			end if
		end tell
	end repeat
end tell