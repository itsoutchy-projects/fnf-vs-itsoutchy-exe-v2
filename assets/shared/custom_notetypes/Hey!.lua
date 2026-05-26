function onCreate()
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Hey!' then
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
		end
	end
end

function goodNoteHit(index, noteData, noteType, isSustain)
    if noteType == "Hey!" then
        triggerEvent("Hey!", "BF", "0.6");
    end
end