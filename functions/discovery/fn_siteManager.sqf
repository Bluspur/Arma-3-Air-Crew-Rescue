//Server Only
if (!isServer) exitWith {};

/* Site number codes:
0 = Site Initialised
1 = Site Discovered
2 = Site Cleared
*/

//Has the array of sites been generated?
waitUntil {!isNil {missionNamespace getVariable "sites"}};

while {sleep 1; true} do {
	
	//Deal with any pending discovery requests
	_requests = missionNamespace getVariable "PendingRequests";
	_sites = missionNamespace getVariable "Sites";
	_forDeletionRequests = [];
	_forDeletionSites = [];

	{
		_x params ["_requestee","_location"];
		_siteID = _sites findIf {(_x select 0) == _location};
		if (_siteID != -1) then {
			_currentState = (_sites select _siteID) select 1;
			if (_currentState == 0) then {
				//Set the sites new state
				(_sites select _siteID) set [1, 1];
				//Notify the world of your glorious discovery 
				_markerText = (_sites select _siteID) select 2;
				_description = formatText ["%1%2%3 Discovered %4%5%6!","<t color='#0099ff'>",name _requestee,"</t>","<t color='#ff4d4d'>",_markerText,"</t>"];
				["DiscoveryStart",[_description]] remoteExecCall ["BIS_fnc_showNotification",0];
				//Update the Marker
				_location setMarkerColorLocal "colorOPFOR";
				_location setMarkerType "mil_unknown";
			};
		};
		//Let the requestee know their evaluation is over
		[] remoteExecCall ["BLU_fnc_resetNamespace", owner _requestee];
		//Mark the request for deletetion
		_forDeletionRequests append [_forEachIndex];
	} forEach _requests;
	//Delete requests that have been assessed
	{
		_requests deleteAt _x;
	} forEach _forDeletionRequests;
	//Check if sites have been cleared
	{
		if (_x select 1 != 2) then {
			_nearbyUnits = allUnits inAreaArray [getMarkerPos (_x select 0),100,100];
			_query = _nearbyUnits findIf {side _x == east};
			if (_query == -1) then {
				//Set the sites new state
				(_sites select _forEachIndex) set [1, 2];
				//Notify the world of your heroism!
				_description = formatText ["%1%2%3 Secured!","<t color='#ff4d4d'>",(_x select 2),"</t>"];
				["DiscoveryEnd",[_description]] remoteExecCall ["BIS_fnc_showNotification",0];
				//Update the Marker
				_x select 0 setMarkerColorLocal "colorBLUFOR";
				_x select 0 setMarkerType "mil_warning";
				//Create a new respawn location at this site
				[getMarkerPos (_x select 0),(_x select 2)] remoteExecCall ["BLU_fnc_addLocalRespawn", [0,-2] select isDedicated, true];
				//Get them ready to be deleted
				_forDeletionSites append [_forEachIndex];
			};
		};
	} forEach _sites;
	//Clear any destroyed sites
	{
		_sites deleteAt _x;		
	} forEach _forDeletionSites;
	//Checks if there are any sites remaining
	if(count _sites <= 0) exitWith {}
};