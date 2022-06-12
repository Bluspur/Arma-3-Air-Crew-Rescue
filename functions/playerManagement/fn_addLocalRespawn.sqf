if (!hasInterface) exitWith {};
params ["_location","_text"];
//Sets the initial respawn position
[player, _location, _text] call BIS_fnc_addRespawnPosition;