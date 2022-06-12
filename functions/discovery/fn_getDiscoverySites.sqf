//Server Only
if (!isServer) exitWith {};

_sites = [];

{
	_name = format ["%1",_x];
	if (["site",_name] call BIS_fnc_inString) then {
		_siteText = markerText _x;
		_sites append [[_x, 0,_siteText]];
	};
} forEach allMapMarkers;

missionNamespace setVariable ["sites",_sites,true];