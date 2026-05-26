function onEvent(event, value1, value2, strumTime)
    if event == "Cut To Colour" then
        if value2 == "0" then
            removeLuaSprite("colourCover");
        else
            makeLuaSprite("colourCover", nil, 0, 0);
            makeGraphic("colourCover", 1920, 1080, value1)
            setObjectCamera("colourCover", "hud");
            addLuaSprite("colourCover", false);
        end
    end
end