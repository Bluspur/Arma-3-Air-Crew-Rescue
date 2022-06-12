params ["_requestee","_location"];

_currentRequests = missionNamespace getVariable "PendingRequests";
_currentRequests pushBack [_requestee,_location];
true;