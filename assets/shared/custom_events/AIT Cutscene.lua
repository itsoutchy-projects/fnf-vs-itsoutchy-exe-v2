function onCreate()
    precacheImage("street bg (bg, ground and lights) cutscenever");
    precacheImage("dark bg");
    precacheImage("space bg");
    precacheImage("stickedBG");
end

function onEvent(event, value1, value2, strumTime)
    if event == "AIT Cutscene" then
        makeLuaSprite("stageCutscene1", "street bg (bg, ground and lights) cutscenever");
        setObjectCamera("stageCutscene1", "hud");
        addLuaSprite("stageCutscene1");
        --triggerEvent("Letterboxing");
        --triggerEvent("HUD", "1");
    end
end

function goodNoteHit(index, noteData, noteType, isSustain)
    hideAllScenes();
end

function opponentNoteHit(index, noteData, noteType, isSustain)
    hideAllScenes();
end

function hideAllScenes()
    for i = 1, 4, 1 do
        if (luaSpriteExists("stageCutscene"..i)) then
            removeLuaSprite("stageCutscene"..i);
        end
    end
end

function onStepHit()
    if songName == "all it takes" then
        if curStep == 32 then
            removeLuaSprite("stageCutscene1");
            makeLuaSprite("stageCutscene2", "dark bg");
            setObjectCamera("stageCutscene2", "hud");
            addLuaSprite("stageCutscene2");
            debugPrint("2");
        end
        if curStep == 64 then
            removeLuaSprite("stageCutscene2");
            makeLuaSprite("stageCutscene3", "space bg");
            setObjectCamera("stageCutscene3", "hud");
            addLuaSprite("stageCutscene3");
            debugPrint("3");
        end
        if curStep == 96 then
            removeLuaSprite("stageCutscene3");
            makeLuaSprite("stageCutscene4", "stickedBG");
            setObjectCamera("stageCutscene4", "hud");
            addLuaSprite("stageCutscene4");
            debugPrint("4");
        end
        if curStep == 128 then
            --removeLuaSprite("stageCutscene4");
            --debugPrint("cutscene1 exists? "..luaSpriteExists("stageCutscene1"));
            hideAllScenes();
        end
    end
end