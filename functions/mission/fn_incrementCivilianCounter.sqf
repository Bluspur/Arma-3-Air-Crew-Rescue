if (!isServer) exitWith {};
params ["_instigator"];
//Was the killer Blufor?
if ((side _instigator == west) || (side _instigator == sideEnemy)) then {
	_count = missionNamespace getVariable "CivilianDeaths";
	_count = _count + 1;
	missionNamespace setVariable ["CivilianDeaths",_count];
};