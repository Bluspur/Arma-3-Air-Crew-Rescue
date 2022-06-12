params ["_caller"];

if (!isServer) exitWith {};

_sites = missionNamespace getVariable "sites";
_siteIndex = _sites findIf {(_x select 0) == "Marker_Site_Prison"};
_siteArray = _sites select _siteIndex;
if ((_siteArray select 1) == 0) then { //Site not yet discovered
	(_sites select _siteIndex) set [1, 1];
	//Notify the world of your glorious discovery 
	_markerText = _siteArray select 2;
	_description = formatText ["%1%2%3 Discovered %4%5%6!","<t color='#0099ff'>",name _caller,"</t>","<t color='#ff4d4d'>",_markerText,"</t>"];
	["DiscoveryStart",[_description]] remoteExecCall ["BIS_fnc_showNotification",0];
	//Update the Marker
	(_siteArray select 0) setMarkerColorLocal "colorOPFOR";
	(_siteArray select 0) setMarkerType "mil_unknown";
	if(is3DENPreview) then {systemChat "Prison site marked successfully"};
}
else {
	if(is3DENPreview) then {systemChat "Prison site already marked, skipping discovery notification"};
};