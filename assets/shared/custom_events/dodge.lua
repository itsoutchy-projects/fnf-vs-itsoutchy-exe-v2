local timeToDodge = 1.5;

local canDodge = false;
local hasDodged = false;

local dodgeTweenTime = 0.1;

function onCreatePost()
    makeLuaSprite("warning", "WARNING");
    screenCenter("warning", "XY");
    setObjectCamera("warning", "hud");
    addLuaSprite("warning", true);
    setProperty("warning.alpha", 0);
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
end