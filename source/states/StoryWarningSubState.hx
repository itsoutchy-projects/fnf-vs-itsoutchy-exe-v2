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

	var warningidx = 0;

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
			Press ENTER to view the webcomic.\n
			Press SPACE to watch the short film.\n
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
		vignette.alpha = 0.5;
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
				if (warningidx != 0) {
					leftState = true;
				} else {
					remove(warnText);
					warnText = new FlxText(0, 0, FlxG.width,
					'This mod may also feature sensitive topics such as:\n
					Suicide\n
					Loneliness\n
					Isolation\n
					Self-harm\n
					Breakdowns\n
					If you or anyone you know are affected by these issues, please talk to a trusted adult.\n
					Remember: you are not alone.\n
					Press ESCAPE to continue anyway. You have been warned.');
					warnText.setFormat(Paths.font(mainFont), 24, FlxColor.WHITE, CENTER);
					//warnText.resetSize();
					//warnText.autoSize = true;
					//warnText.fieldWidth = FlxG.width;
					//warnText.fieldHeight = FlxG.height;
					warnText.scrollFactor.set();
					warnText.screenCenter(XY);
					warnText.alpha = 0.0;
					add(warnText);
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(warnText, { alpha: 1.0 }, 0.6, { ease: FlxEase.sineIn });
					//warnText.draw();
					warningidx = 1;
				}
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
