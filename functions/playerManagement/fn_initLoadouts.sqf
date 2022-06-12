if (!isServer) exitWith {};

_configLoadouts = "true" configClasses (missionConfigFile >> "CfgRespawnInventory");
{
	_stringConfig = configName _x;
	[west, [_stringConfig,-1,-1]] call BIS_fnc_addRespawnInventory;
} forEach _configLoadouts;