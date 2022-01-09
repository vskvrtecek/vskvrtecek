function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Warning Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_Warning'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

function noteMiss(id, direction, noteType, isSustainNote)
		if noteType == "Warning Note" then
				triggerEvent('Play Animation', 'hurt', 1);
				setProperty('health', 0.2);
		end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
		if noteType == "Warning Note" then
				if keyJustPressed('left') then
						triggerEvent('Play Animation', 'dodge', 1);
				elseif keyJustPressed('down') then
						triggerEvent('Play Animation', 'dodge', 1);
				elseif keyJustPressed('up') then
						triggerEvent('Play Animation', 'dodge', 1);
				elseif keyJustPressed('right') then
						triggerEvent('Play Animation', 'dodge', 1);
				end
		end
end