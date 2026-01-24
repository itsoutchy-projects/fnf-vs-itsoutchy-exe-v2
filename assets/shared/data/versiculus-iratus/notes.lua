local enabled = true;

function onCountdownStarted()
    if enabled then
        doTweenAlpha("notes-invis", "camHUD", 0, 0.1)
    end
end

function showNotes()
    if enabled then
        doTweenAlpha("notes-show", "camHUD", 1, 0.3)
    end
end

function onStepHit()
    if enabled then
        if curStep == 232 then
            showNotes()
        end
    end
end