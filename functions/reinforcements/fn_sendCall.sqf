params ["_callerArea","_targetLocation"];
_marker = str _callerArea;

//Create a marker for debugging during preview
if (is3DENPreview) then {
	if (isNil getMarkerType _marker) then {
	_marker = createMarkerLocal [str _callerArea, _targetLocation];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "hd_dot";
	};
	_marker setMarkerColorLocal "ColorRed";
	_text = format ["%1 -- %2",_callerArea,_targetLocation];
	_marker setMarkerTextLocal _text;
};

//Append the request to the reinforcement system
_update = ReinforceLogic getVariable "Callouts";
_update append [[_callerArea,_targetLocation]];

systemChat format ["Request for Reinforcements at %1 successful",_callerArea];

true;