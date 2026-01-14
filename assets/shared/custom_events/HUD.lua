local duration = 0.1

local tweenedHud = {
    'timeBar',
    'timeBarBG',
    'healthBar',
    'healthBarBG',
    'iconP1',
    'iconP2',
    'timeTxt',
    'scoreTxt',
    'songNameTxt'
}

local hudHidden = false;

function onEvent(event, value1, value2, strumTime)
    if (event == "HUD") then
        if (value1 == "0" and not hudHidden == false) then
            -- hud visible
            for i, specHud in pairs(tweenedHud) do --repeats i amount of times.
                doTweenAlpha('tween'..i, specHud, 1, duration) --Tweens the alpha of all the items in the table.
            end
            for i = 0, 7 do
                noteTweenAlpha("showNote"..i, i, 1, duration)
            end
            --doTweenAlpha("hudVisible", "camHUD", 1, duration)
        end
        if (value1 == "1" and not hudHidden) then
            -- hud invisible
            for i, specHud in pairs(tweenedHud) do --repeats i amount of times.
                doTweenAlpha('tween'..i, specHud, 0, duration) --Tweens the alpha of all the items in the table.
            end
            for i = 0, 7 do
                noteTweenAlpha("hideNote"..i, i, 0, duration)
            end
            --doTweenAlpha("hudInvisible", "camHUD", 0, duration)
        end
        hudHidden = not hudHidden;
    end
end