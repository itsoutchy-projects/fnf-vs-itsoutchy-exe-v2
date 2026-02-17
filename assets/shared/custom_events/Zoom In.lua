local zoomedIn = false;

local zoomLevelDefault = 1.05;
local zoomLevelZoomed = 0.1; -- added onto zoomLevelDefault

local usedEvent = false;

-- function onCreatePost()
--     runHaxeCode([[
--         function getStageZoom() {
--             var stageData:StageFile = StageData.getStageFile("]] + curStage + [[");
--             return stageData.defaultZoom;    
--         }
--     ]]);
--     zoomLevelDefault = runHaxeFunction("getStageZoom");
-- end

function onEvent(event, value1, value2, strumTime)
    if (event == "Zoom In") then
        if (not usedEvent) then
            zoomLevelDefault = getProperty("defaultCamZoom");
            usedEvent = true;
        end
        zoomedIn = not zoomedIn;
        if (zoomedIn) then
            setProperty("defaultCamZoom", zoomLevelDefault + zoomLevelZoomed);
        else
            setProperty("defaultCamZoom", zoomLevelDefault);
        end
    end
end