if(!isServer) exitWith {};

_count = missionNamespace getVariable "CrewCounter";
_count = _count - 1;
missionNamespace setVariable ["CrewCounter",_count];

if (is3DENPreview) then {systemChat format ["A crewman who was previously counted has been killed, counter now at %1",_count]};