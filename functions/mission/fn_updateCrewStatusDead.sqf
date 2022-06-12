if (!isServer) exitWith {};
params ["_victim","_killer"];
_status = missionNamespace getVariable "CrewStatus";
_statusIndex = _status findIf {(_x select 0) == _victim};
if (_statusIndex != -1) then {
	if (isPlayer _killer) then {
		(_status select _statusIndex) set [1,-1];
		(_status select _statusIndex) set [2,_killer];
	} else {
		(_status select _statusIndex) set [1,0];
	};
	if (is3DENPreview) then {systemChat format ["%1 has killed %3 %2, their status has been updated",name _killer,name _victim,toLowerANSI (rank _victim)]};
}
else {
	if (is3DENPreview) then {systemChat format ["Crewman has been killed but an error occured while updating their status"]};
};
