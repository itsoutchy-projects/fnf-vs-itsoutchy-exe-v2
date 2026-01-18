function onCreate()
    triggerEvent("HUD", "1");
end

function onStepHit()
    if curStep == 1088 then
        makeLuaSprite("redVignette", "red vignette");
        setObjectCamera("redVignette", "hud");
        addLuaSprite("redVignette", true);
    end
    if curStep == 1408 then
        doTweenAlpha("redVigAlphLower", "redVignette", 0.3, 0.1);
    end
    if curStep == 1920 then
        doTweenAlpha("redVigAlphHightened", "redVignette", 1, 0.1);
    end
end