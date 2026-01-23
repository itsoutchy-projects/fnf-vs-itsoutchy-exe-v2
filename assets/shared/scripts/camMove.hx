import flixel.addons.display.FlxBackdrop;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxState;

import objects.BGSprite;
import objects.Character;
import states.PlayState;
import backend.Paths;

var lookingX = 0;
var lookingY = 0;

var enabled = true;
var cameraRotation = false;

var strength = 50;
var bf_multiply = 1;
var dad_multiply = 1;

var dad0;
var bf0;

var camAngle:Map<String, Int> = [
    'singLEFT' => -2,
    'singDOWN' => 4,
    'singUP' => -4,
    'singRIGHT' => 2,
    'singLEFT-alt' => -2,
    'singDOWN-alt' => 4,
    'singUP-alt' => -4,
    'singRIGHT-alt' => 2
];

function onUpdate(){
    if (enabled) {
        if (Paths.formatToSongPath(PlayState.SONG.song) == "all-it-takes") {
            dad_multiply = 4;
        }
        setVar('bf0', boyfriend);
        setVar('dad0', dad);
        if (!PlayState.SONG.notes[curSection].mustHitSection) {
            lookingX = dad.getMidpoint().x + 150 + dad.cameraPosition[0] + opponentCameraOffset[0];
            lookingY = dad.getMidpoint().y - 100 + dad.cameraPosition[1] + opponentCameraOffset[1];
            setCharacterProperties('dad0', lookingX, lookingY, dad_multiply * strength);
        }else{
            lookingX = boyfriend.getMidpoint().x - 100 - (boyfriend.cameraPosition[0] + boyfriendCameraOffset[0]);
            lookingY = boyfriend.getMidpoint().y - 100 + (boyfriend.cameraPosition[1] + boyfriendCameraOffset[1]);
            setCharacterProperties('bf0', lookingX, lookingY, bf_multiply * strength);
        }
    }
}

function setCharacterProperties(char:String, x, y, strnth){
    var camoffsetxy:Map<String, Array<Dynamic>> = [
        'singLEFT' => [-strnth, 0],
        'singDOWN' => [0, strnth],
        'singUP' => [0, -strnth],
        'singRIGHT' => [strnth, 0],
        'singLEFT-alt' => [-strnth, 0],
        'singDOWN-alt' => [0, strnth],
        'singUP-alt' => [0, -strnth],
        'singRIGHT-alt' => [strnth, 0]
    ];
    if (camoffsetxy.exists(getVar(char).animation.curAnim.name)){
        camFollow.x = x + camoffsetxy.get(getVar(char).animation.curAnim.name)[0];
        camFollow.y = y + camoffsetxy.get(getVar(char).animation.curAnim.name)[1];
    }else{
        camFollow.x = x;
        camFollow.y = y;
    }
    if (cameraRotation) {
        if (camAngle.exists(getVar(char).animation.curAnim.name)){
            FlxTween.tween(camGame, {angle: camAngle.get(getVar(char).animation.curAnim.name)}, 1, {ease: FlxEase.circOut});
        }else{
            FlxTween.tween(camGame, {angle: 0}, 1, {ease: FlxEase.circOut});
        }
    }
}

function onEvent(name, v1, v2){
	if (name == "disable cam follow") {
		if (Std.parseInt(v1) > 0) {
			enabled = false;
        }else{
			enabled = true;
		}
	}
    if (name == "enable cam rotation") {
		if (Std.parseInt(v1) > 0) {
			cameraRotation = true;
        }else{
			cameraRotation = false;
            FlxTween.tween(camGame, {angle: 0}, 1, {ease: FlxEase.circOut});
		}
	}
}