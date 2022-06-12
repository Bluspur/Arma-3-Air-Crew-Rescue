if (!isServer) exitWith {};

params ["_crewOne","_crewTwo","_crewThree"];

//Initial Objective
//Objective Main
[
	true,
	"ObjectiveMain",
	"ObjectiveMain",
	objNull,
	"ASSIGNED",
	-1,
	true,
	"search"
] call BIS_fnc_taskCreate;

//Populate the crew status array
_crewArray = [_crewOne,_crewTwo,_crewThree];
_statusArray = missionNamespace getVariable "CrewStatus";
{
	if (alive _x) then {
		_statusArray pushBack [_x,1,objNull];
	}
	else {
		_statusArray pushBack [_x,0,objNull];
	}
} forEach _crewArray;

_countComplete = false;
_evacComplete = false;
//Main Loop
while {sleep 2; !_evacComplete} do {
	_currentCount = missionNamespace getVariable "CrewCounter";
	if (_currentCount == 3 && !_countComplete) then {
		["ObjectiveMain","SUCCEEDED"] call BIS_fnc_taskSetState;
		_countComplete = true;
		[
			true,
			"ObjectiveEvac",
			"ObjectiveEvac",
			objNull,
			"ASSIGNED",
			-1,
			true,
			"run"
		] call BIS_fnc_taskCreate;
		if (is3DENPreview) then {systemChat "Evacuation counter has begun"};
	};
	if(_countComplete && !_evacComplete && _currentCount == 3) then {
		_livingCrew = {alive _x} count _crewArray;
		_crewInDistance = {((_x distance (getMarkerPos "Marker_Feature_PlayerStart")) < 75) && alive _x} count _crewArray;
		_headlessClients = entities "HeadlessClient_F";
		_livingPlayers = {alive _x} count (allPlayers - _headlessClients);
		_playersInDistance = {((_x distance (getMarkerPos "Marker_Feature_PlayerStart")) < 200) && alive _x} count (allPlayers - _headlessClients);
		if (is3DENPreview) then {systemChat format ["Evac: %1 out of %2 Crew, %3 out of %4 Players",_crewInDistance,_livingCrew,_playersInDistance,_livingPlayers]};
		if((_crewInDistance == _livingCrew) && (_playersInDistance == _livingPlayers)) then {
			["ObjectiveEvac","SUCCEEDED"] call BIS_fnc_taskSetState;
			_evacComplete = [_crewArray] call BLU_fnc_evaluateEnd;
		};
	};
};