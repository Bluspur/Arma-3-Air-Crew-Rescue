//Get Player Music Volume 
_musicVolume = musicVolume;
//Get Player Sound Volume
_soundVolume = soundVolume;

//Black out the screen indefinitely
"Blu_layer" cutText ["","BLACK FADED",30];
//Set Sound volume to 0
0 fadeSound 0;

waitUntil {!isNull Player};

//Disable player movement
player enableSimulation false;

//Debugging stuff
if (is3DENPreview) then {
	systemChat "Intro sequence pausing until Player has loaded into game";
};

//Wait until the player is loaded in 
waitUntil {(getClientStateNumber == 10 || !isMultiplayer) && (missionNamespace getVariable ["BIS_fnc_startLoadingScreen_ids",[]] isEqualTo [])};

//Debugging stuff
if (is3DENPreview) then {
	systemChat "Player Loaded, continuing Intro";
};

sleep 2;

//Begin music at volume 0
["CUP_A2_Indian_Summer",0,0] call BIS_fnc_playMusic;

//Tell the music to fade to volume 0.5 over 90 seconds
90 fadeMusic _musicVolume;

sleep 1;

//Start the intro text
[["Operation Iron Sabre",4,1],["Bystrica Region, Chernarus",4,1],["February 6th, 2021",4,1,5]] spawn BIS_fnc_EXP_camp_SITREP;

sleep 10;

//Enable player movement
player enableSimulation true;
//Fade in from the black screen
"Blu_layer" cutText ["","BLACK IN",5];
//Fade the players sound back in
5 fadeSound _soundVolume;