//Server Only
if (!isServer) exitWith {};

private _spawnLocations = [];

{
	_name = format ["%1",_x];
	if (["east_spawn",_name] call BIS_fnc_inString) then {
		_spawnLocations append [_x];
	};
} forEach allMapMarkers;

missionNamespace setVariable ["ReinforcementOrigins",_spawnLocations];