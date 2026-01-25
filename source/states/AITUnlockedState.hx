package states;

import ModSpecificPrefs.mainFont;

class AITUnlockedState extends MusicBeatState {
    var text:FlxText;
    var bg:FlxSprite;

    var takeToFreeplay:Bool;

    // yippee you unlocked it yayayay
    public function new(freeplay : Bool) {
        takeToFreeplay = freeplay;
        super();
    }

    override function create() {
        super.create();

        bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.5;
		bg.scrollFactor.set();
		add(bg);
        
        text = new FlxText(0, 0, 0, "A new song awaits you in freeplay...\nPress ENTER to continue");
        text.setFormat(Paths.font(mainFont), 64, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        text.scrollFactor.set();
        text.screenCenter(XY);
        add(text);
    }

    override function update(elapsed:Float) {
        if (controls.ACCEPT) {
            if (takeToFreeplay) {
                MusicBeatState.switchState(new FreeplayState());
            } else {
                MusicBeatState.switchState(new StoryMenuState());
            }
        }
        super.update(elapsed);
    }
}