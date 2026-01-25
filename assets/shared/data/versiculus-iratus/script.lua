function getTextVisibleSize(tag)
    return {getProperty(tag..".graphic.width"), getProperty(tag..".graphic.height")}
end

-- they deserve the credits, their work is incredible
-- wednesday's infidelity is still one of my favourite mods (next to funkin.avi)
function onCreatePost()
    makeLuaText("credsText", "VERSICULUS IRATUS\nCharted by: Tok (Wednesday's Infidelity)\nREMIXED BY ME\nOriginal song by: GoddessAwe & Jhaix");
    setTextAlignment("credsText", "center");
    setTextFont("credsText", "Times New Roman.ttf");
    setTextSize("credsText", 32);
    setTextItalic("credsText", true);
    setObjectCamera("credsText", "hud");
    screenCenter("credsText", "xy");
    setProperty("credsText.underline", true);

    local credSize = getTextVisibleSize("credsText");
    makeLuaSprite("credsBox", nil);
    makeGraphic("credsBox", credSize[1] + 5, credSize[2] + 5, "000000");
    setObjectCamera("credsBox", "hud");
    screenCenter("credsBox", "xy");
    setProperty("credsBox.alpha", 0.5);

    addLuaSprite("credsBox", true);
    addLuaText("credsText", true);
end

function onStepHit()
    if curStep == 232 then
        runTimer("fadeCreditsTextTimer", 10);
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "fadeCreditsTextTimer" then
        doTweenAlpha("fadeCreditsText", "credsText", 0, 1.25);
        doTweenAlpha("fadeCreditsBox", "credsBox", 0, 1.25);
    end
end