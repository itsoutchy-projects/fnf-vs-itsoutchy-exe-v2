local middlescrollchanged = false; -- bc no one else will play this (at least in my case) <-- i was saying? XD
local middlescrollTweenDuration = 0.3;

local defaultOppArrPos = {
    defaultOpponentStrumX0,
    defaultOpponentStrumX1,
    defaultOpponentStrumX2,
    defaultOpponentStrumX3
}

function getStrumDefaultX(idx)
    --if idx == 0 then
    --    return defaultOpponentStrumX0 -- omfg why is that returning zero?
    --end
    if idx == 0 then
        return 92
    end
    if idx == 1 then
        return defaultOpponentStrumX1
    end
    if idx == 2 then
        return defaultOpponentStrumX2
    end
    if idx == 3 then
        return defaultOpponentStrumX3
    end

    if idx == 4 then
        return defaultPlayerStrumX0
    end
    if idx == 5 then
        return defaultPlayerStrumX1
    end
    if idx == 6 then
        return defaultPlayerStrumX2
    end
    if idx == 7 then
        return defaultPlayerStrumX3
    end
end

function onCreatePost()
    defaultOppArrPos = {
        getPropertyFromGroup("opponentStrums", 0, "x"),
        getPropertyFromGroup("opponentStrums", 1, "x"),
        getPropertyFromGroup("opponentStrums", 2, "x"),
        getPropertyFromGroup("opponentStrums", 3, "x")
    }
end

function onEvent(event, value1, value2, strumTime)
    if event == "Middlescroll" then
        if value1 == "0" then
            -- off
            middlescrollchanged = false;
            -- Credit to Draconic-Hybrid on Github
            -- (oml wth was wrong with my code)
            -- V
            noteTweenX("om1",0,92,middlescrollTweenDuration,"smoothStepInOut")
			noteTweenX("om2",1,204,middlescrollTweenDuration,"smoothStepInOut")
			noteTweenX("om3",2,316,middlescrollTweenDuration,"smoothStepInOut")
			noteTweenX("om4",3,428,middlescrollTweenDuration,"smoothStepInOut")
            noteTweenX("p1",4,732,middlescrollTweenDuration,"smoothStepInOut")
            noteTweenX("p2",5,844,middlescrollTweenDuration,"smoothStepInOut")
            noteTweenX("p3",6,956,middlescrollTweenDuration,"smoothStepInOut")
            noteTweenX("p4",7,1068,middlescrollTweenDuration,"smoothStepInOut")
            -- ^

            for i = 0, getProperty('opponentStrums.length') do
                noteTweenAlpha("opponentStrumsFadeIn"..i, i, 1, middlescrollTweenDuration)
            end
        end
        if value1 == "1" then
            -- on

            -- if you plan on sharing this script/putting it in your mod, make sure to check if the player
            -- has middlescroll enabled.
            if not middlescroll then
                for i = 0, getProperty('opponentStrums.length') do
                    --setPropertyFromGroup('opponentStrums', i, 'x', getStrumDefaultX(getProperty('opponentStrums.length') + i) - 320);
                    noteTweenX("opponentStrumsMiddleScrollOn"..i, i, getStrumDefaultX(getProperty('opponentStrums.length') + i) - 320, middlescrollTweenDuration);
                    noteTweenX("playerStrumsMiddleScrollOn"..i, getProperty('opponentStrums.length') + i, getStrumDefaultX(getProperty('playerStrums.length') + i) - 320, middlescrollTweenDuration);
                    --setPropertyFromGroup('playerStrums', i, 'x', getStrumDefaultX(getProperty('playerStrums.length') + i) - 320);
                    noteTweenAlpha("opponentStrumsFadeOut"..i, i, 0.3, middlescrollTweenDuration)
                    --doTweenAlpha("opponentStrumsFadeOut"..i, "opponentStrums", 0.3, middlescrollTweenDuration);
                    --setPropertyFromGroup('opponentStrums', i, 'alpha', 0.3);
                end
                -- for i = 0, getProperty('playerStrums.length') do
                --     setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup("opponentStrums", i, "x"));
                -- end
                middlescrollchanged = true;
            end
        end
    end
end