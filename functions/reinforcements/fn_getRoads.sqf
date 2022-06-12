
_center = "Markers_Areas_DangerZone";
_roads = [];

{
    _node = _x;
    if ( isOnRoad getPos _node || [ "bridge", getModelInfo _node select 0 ] call BIS_fnc_inString ) then {
        _roads pushBack (getPos _node);
    };
}forEach ( (getMarkerPos _center) nearRoads (( (getMarkerSize _center) select 0 ) * 1.4142 ));

if(is3DENPreview) then {systemChat format ["%1 Road Reinfocement Locations Registered",(count _roads)]};

_roads;