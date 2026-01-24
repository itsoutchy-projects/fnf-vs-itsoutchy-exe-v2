function onCreatePost()
    makeLuaSprite("vignette", "vignette");
    setObjectCamera("vignette", "other");
    addLuaSprite("vignette", true);
    setProperty("vignette.alpha", 0.5);
end