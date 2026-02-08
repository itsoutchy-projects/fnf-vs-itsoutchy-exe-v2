local allowEnd = false;

function onEndSong()
	if not allowEnd then
		startVideo('breakingDown');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end