package states.editors;

import backend.ui.PsychUIEventHandler.PsychUIEvent;
import objects.Character;

class CharacterTestingState extends MusicBeatState implements PsychUIEvent {
    var character:Character;
    var charFile:CharacterFile;

    var characterPos:FlxPoint;

    var dropdownChar:PsychUIDropDownMenu;

    var characterList:Array<String> = [];

    var singing = false;

    //var stageGroup:FlxSpriteGroup;

    //var dropdownStage:PsychUIDropDownMenu;

    function reloadCharacters() {
        var foldersToCheck:Array<String> = Mods.directoriesWithFile(Paths.getSharedPath(), 'characters/');
        for (folder in foldersToCheck) {
            for (file in FileSystem.readDirectory(folder)) {
                if (!file.toLowerCase().endsWith(".json"))
                    continue;
                var charToCheck:String = file.substr(0, file.length - 5);
                characterList.push(charToCheck);
            }
        }
    }
    // function reloadStages() {
    //     var stitches = [];
    //     for (stage in stages) {
    //         stitches.push(stage.)
    //     }
    // }

    override function create() {
        FlxG.sound.music.volume = 1;
        reloadCharacters();
        FlxG.mouse.visible = true;
        //stageGroup = new FlxSpriteGroup(0, 0);
        character = new Character(0, 0);
        dropdownChar = new PsychUIDropDownMenu(50, 50, characterList, function(i, name) {
            character.changeCharacter(name);
            character.flipX = false;
            character.screenCenter(XY);
            characterPos = new FlxPoint(character.x, character.y);
        });
        dropdownChar.selectedLabel = Character.DEFAULT_CHARACTER;
        dropdownChar.x = FlxG.width - dropdownChar.width - 50;
        character.flipX = false;
        character.screenCenter(XY);
        characterPos = new FlxPoint(character.x, character.y);
        add(character);
        add(dropdownChar);

        super.create();
    }

    override function beatHit() {
        if (!singing) {
            character.playAnim("idle");
        }
        super.beatHit();
    }

    override function update(elapsed:Float) {
        if (FlxG.sound.music != null)
			Conductor.songPosition = FlxG.sound.music.time;

        if (controls.BACK) {
            MusicBeatState.switchState(new MasterEditorMenu());
        }

        if (controls.NOTE_LEFT) {
            character.playAnim("singLEFT");
            singing = true;
        } else if (controls.NOTE_DOWN) {
            character.playAnim("singDOWN");
            singing = true;
        } else if (controls.NOTE_UP) {
            character.playAnim("singUP");
            singing = true;
        } else if (controls.NOTE_RIGHT) {
            character.playAnim("singRIGHT");
            singing = true;
        } else {
            singing = false;
        }

        // character.x = characterPos.x - character.offset.x;
        // character.y = characterPos.y - character.offset.y;
        super.update(elapsed);
    }

    public function UIEvent(id:String, sender:Dynamic) {}
}