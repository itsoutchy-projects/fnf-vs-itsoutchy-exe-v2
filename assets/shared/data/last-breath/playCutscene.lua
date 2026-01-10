local allowEnd = false;

function onEndSong()
	if not allowEnd then
		startVideo('last breath');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end