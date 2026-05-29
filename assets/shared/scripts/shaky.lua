local shakeDuration = 0.2;

function opponentNoteHit(index, noteData, noteType, isSustain)
    if boyfriendName == "bf scared" then
        cameraShake("game", 0.0005, shakeDuration);
        cameraShake("hud", 0.0025, shakeDuration);
    end
end