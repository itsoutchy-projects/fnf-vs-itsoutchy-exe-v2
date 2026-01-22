local timeToDodge = 1;

local canDodge = false;
local hasDodged = false;

local dodgeTweenTime = 0.1;

local dodgeSongs = {
    "deleted"
}

local dodgeKey = "SPACE";

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function onCreatePost()
    makeLuaSprite("warning", "WARNING");
    screenCenter("warning", "XY");
    setObjectCamera("warning", "hud");
    addLuaSprite("warning", true);
    setProperty("warning.alpha", 0);

    if has_value(dodgeSongs, songName) then
        makeLuaText("dodgeWarning", "Your dodge key is "..dodgeKey..".");
        setTextFont("dodgeWarning", "Times New Roman - Bold.ttf");
        setTextSize("dodgeWarning", 50);
        setObjectCamera("dodgeWarning", "hud");
        addLuaText("dodgeWarning");
        screenCenter("dodgeWarning", "xy");
        runTimer("dodgeWarningShowing", 10);
    end
end

function onEvent(event, value1, value2, strumTime)
    if event == "dodge" then
        doTweenAlpha("dodgeShow", "warning", 1, dodgeTweenTime);
        playSound("dodge!");
        canDodge = true;
    end
end

function onUpdate(elapsed)
    if canDodge then
        if keyboardJustPressed("SPACE") or botPlay then
            hasDodged = true;
            cameraFlash("hud", "FFFFFF", 0.5);
            playSound("dodged!");
            canDodge = false;
        end
    end
end

function onTweenCompleted(tag, vars)
    if tag == "dodgeShow" then
        runTimer("dodgeTimer", timeToDodge);
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "dodgeTimer" then
        if not hasDodged then
            setHealth(0);
        end
        hasDodged = false;
        doTweenAlpha("hideDodge", "warning", 0, dodgeTweenTime);
    end
    if tag == "dodgeWarningShowing" then
        doTweenAlpha("dodgeWarningHiding", "dodgeWarning", 0, 0.5);
    end
end