local defaultZoom = 0;
function onCreatePost()
    defaultZoom = getProperty("defaultCamZoom");
end

function onEvent(event, value1, value2, strumTime)
    if event == "Set Default Camera Zoom" then
        setProperty("defaultCamZoom", defaultZoom * value1);
    end
end