package states;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

import states.MainMenuState;
import states.TitleState;

import ModSpecificPrefs.mainFont;

class StoryWarningSubstate extends MusicBeatSubstate
{
	var leftState:Bool = false;

	var bg:FlxSprite;
	var warnText:FlxText;

	var vignette:FlxSprite;

	override function create()
	{
		super.create();

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.scrollFactor.set();
		bg.alpha = 0.0;
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			'Sup! This mod might not show the whole story, so:\n
			-----------------------------------------------\n
			Press ENTER to view the webcomic\n
			Press SPACE to watch the short film\n
			Press ESCAPE to proceed anyway.\n
			-----------------------------------------------\n
			Thank you for playing this mod!',
			32);
		warnText.setFormat(Paths.font(mainFont), 32, FlxColor.WHITE, CENTER);
		warnText.scrollFactor.set();
		warnText.screenCenter(Y);
		warnText.alpha = 0.0;
		add(warnText);
		
		vignette = new FlxSprite(0, 0, Paths.image("vignette"));
		add(vignette);

		FlxTween.tween(bg, { alpha: 0.8 }, 0.6, { ease: FlxEase.sineIn });
		FlxTween.tween(warnText, { alpha: 1.0 }, 0.6, { ease: FlxEase.sineIn });
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.WARNING_ACCEPT) {
				leftState = true;
				CoolUtil.browserLoad("https://comic.itsoutchy.xyz/comic");
			}
			if (controls.WARNING_SPACE) {
				leftState = true;
				CoolUtil.browserLoad("https://www.youtube.com/watch?v=mSapwq1sV9k");
			}
			else if(controls.BACK) {
				leftState = true;
			}
			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(bg, { alpha: 0.0 }, 0.9, { ease: FlxEase.sineOut });
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					ease: FlxEase.sineOut,
					onComplete: function (twn:FlxTween) {
						//FlxG.state.persistentUpdate = true;
						MusicBeatState.switchState(new TitleState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}
