local tweenDur = 0.6;

function onStepHit()
    if curStep == 320 then
        doTweenAlpha("groundTweenLow", "ground", 0, tweenDur);
        doTweenAlpha("lightsTweenLow", "sprite1", 0, tweenDur);
    end
    if curStep == 576 then
        doTweenAlpha("groundTweenHigh", "ground", 1, tweenDur);
        doTweenAlpha("lightsTweenHigh", "sprite1", 1, tweenDur);
    end
end