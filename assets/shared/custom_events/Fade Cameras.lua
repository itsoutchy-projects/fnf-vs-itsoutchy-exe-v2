function onEvent(event, value1, value2, strumTime)
    if event == "Fade Cameras" then
        local duration = songLength - getSongPosition()
        cameraFade("other", "black", duration / 1000, true)
    end
end