local areBarsOn = false;

function onEvent(event, value1, value2, strumTime)
    areBarsOn = not areBarsOn;
    if (areBarsOn) then
        luaGraphic("top", 0, 100 * 0.5)
        doTweenY("scaleTopBar", "top.scale", 100, 1)
        luaGraphic("bottom", 0, screenHeight - 100 * 0.5)
        doTweenY("scaleBottomBar", "bottom.scale", 100, 1)
    else
        removeLuaSprite("top")
        removeLuaSprite("bottom")
    end
end

function luaGraphic(tag,x,y)
	makeLuaSprite(tag, nil, x, y)
	makeGraphic(tag, screenWidth, 1, "000000")
    if version == "1.0" then
        setProperty(tag..".camera", instanceArg("camHUD"), false, true)
    else
        setObjectCamera(tag, "HUD")
    end
	addLuaSprite(tag)
end