/*
//TODO search at destination is semi-functional, consider switching to a lambs function for a less aggressive patrol.
If the area is clear and a certain time has elapsed it needs to send the group back to their vehicle
It needs to check that their vehicle is still usable and if not, either fix it or search for another vehicle
It needs to remount the group
It needs to mark the group as available
It needs to move the group back to their origin point
*/

_reactionGroup = _this select 0;
_vehicle = _this select 1;
_target = _this select 2;

//Check One
if ((isNull _reactionGroup) || (behaviour (leader _reactionGroup) == "COMBAT")) exitWith {
	//Either the group is dead or they are in combat
};

//Check if everyone is mounted
waitUntil {
	({vehicle _x  != _x} count (units _reactionGroup)) == ( {alive _x} count (units _reactionGroup))
	};

//Clear any existing waypoints
{
	[_reactionGroup, (currentWaypoint _reactionGroup)] setWaypointPosition [getPosASL ((units _reactionGroup) select 0), -1];
	sleep 0.1;
	for "_i" from count waypoints _reactionGroup - 1 to 0 step -1 do 
	{
		deleteWaypoint [_reactionGroup, _i];
	};
};

//Evaluate where the closest road disembarkation point is to the target
_roads = ReinforceLogic getVariable "Roads";
_sortedRoads = _roads apply {_x distance _target};
_minIndex = _sortedRoads findIf {_x == selectMin _sortedRoads};
_dropLocation = _roads select _minIndex;

//Creates a marker at the destination
_dropMarker = createMarker [[_reactionGroup,"_dismount"] joinString "", _dropLocation];
_dropMarker setMarkerType "mil_start";
if (is3DENPreview) then {_dropMarker setMarkerAlpha 1;} else {_dropMarker setMarkerAlpha 0;};

//Add a waypoint at the evaluated road tile
_wp0 = _reactionGroup addWaypoint [_dropLocation,-1];
_wp0 setWaypointType "GETOUT";

//Establish the size of the groups search area by using a Rectangle Marker
_searchMarker = createMarker [[_reactionGroup,"_area"] joinString "", _target];
_searchMarker setMarkerShape "RECTANGLE";
_searchMarker setMarkerSize [200, 200];
if (is3DENPreview) then {_searchMarker setMarkerAlpha 1;} else {_searchMarker setMarkerAlpha 0;};

//Adds the waypoint for after the group dismounts and give them a search and destroy task
_wp1 = _reactionGroup addWaypoint [getMarkerPos _searchMarker,-1];
_wp1 setWaypointType "MOVE";
waitUntil {(currentWaypoint _reactionGroup) == ((count waypoints _reactionGroup))};
[_reactionGroup, _searchMarker] call CBA_fnc_taskSearchArea;

