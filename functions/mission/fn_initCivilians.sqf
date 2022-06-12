if(!isServer) exitWith {};
params ["_unit"];
//Adds a killed eventhandler
_unit addMPEventHandler ["MPKilled",{
	params ["_unit","_killer","_instigator","_useEffects"];
	[_instigator] remoteExecCall ["BLU_fnc_incrementCivilianCounter",2];
	}];