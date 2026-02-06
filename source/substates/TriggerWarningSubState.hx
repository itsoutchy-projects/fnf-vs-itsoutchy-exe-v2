package substates;

import states.FreeplayState;
import ModSpecificPrefs.mainFont;
import backend.WeekData;
import backend.Highscore;

import flixel.FlxSubState;

class TriggerWarningSubState extends MusicBeatSubstate
{
	var bg:FlxSprite;
	var alphabetArray:Array<Alphabet> = [];

	var song:String;
	var difficulty:Int;
	var week:Int;

	public var playSong:Bool = false;

	public var releasedEnter = false;

	public var freeplay:FreeplayState;

	public function new(song : String, freeplay : FreeplayState) {
		this.song = song;
		this.freeplay = freeplay;
		super();
	}

	public override function create() {
		bg = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		add(bg);
		var mainText = new Alphabet(0, 0, 'The song "${song}" may be triggering for some players.\nPlay at your own risk.\n\nPress ENTER to continue.\nPress ESCAPE to go back.\n\nYou have been warned.');
		//mainText.setFormat(Paths.font(mainFont), 32, FlxColor.WHITE, CENTER);
		//mainText.updateHitbox();
		mainText.scaleX = 0.45;
		mainText.scaleY = 0.45;
		mainText.screenCenter(XY);
		mainText.alpha = 0;
		add(mainText);
		alphabetArray.push(mainText);
		super.create();
	}

	public override function update(elapsed:Float) {
		bg.alpha += elapsed * 1.5;
		if(bg.alpha > 0.6) bg.alpha = 0.6;

		for (i in 0...alphabetArray.length) {
			var spr = alphabetArray[i];
			spr.alpha += elapsed * 2.5;
		}

		if (!controls.ACCEPT) {
			releasedEnter = true;
		}
		if (controls.ACCEPT && releasedEnter) {
			FlxG.sound.play(Paths.sound('cancelMenu'), 1);
			playSong = true;
			freeplay.goToSong(song);
			close();
		} else if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'), 1);
			playSong = false;
			close();
		}
		super.update(elapsed);
	}
}