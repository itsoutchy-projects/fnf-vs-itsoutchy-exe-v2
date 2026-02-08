local shaderName = "glitch";

function onCreate()
    makeLuaSprite("glitch");
    makeGraphic("glitchShaderImage");
    setSpriteShader("glitchShaderImage", "glitch");
    callOnLuas("doneGlitch");
end

function onUpdate(elapsed)
    setShaderFloat("glitch", "iTime", elapsed);
end