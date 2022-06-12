//Has the array of sites been generated?
waitUntil {!isNil {missionNamespace getVariable "sites"}};

//For evaluation
_sites = missionNamespace getVariable "sites";
profileNamespace setVariable ["underEvaluation",false];

//Loop through available sites and check if I am near to a site
while {sleep 1; count _sites > 0} do {

	//Get an updated list of sites
	_sites = missionNamespace getVariable "sites";

	if !(profileNamespace getVariable "underEvaluation") then {
		//Checks the distance to each site
		{
			_siteMarker = _x select 0;
			if ((player distance (getMarkerPos _siteMarker) < 50) && ((_x select 1) == 0)) then {
				[player,_siteMarker] remoteExecCall ["BLU_fnc_makeRequest",2];
				profileNamespace setVariable ["underEvaluation",true];
			};
		} forEach _sites;
	};
};