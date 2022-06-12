/*To register a unit as capable of calling reinforcements then add this to their init line:
	this setVariable ["RegisterCaller",CALLER AREA REFERENCE];
To register an area as a unique zone for calling reinforcements add this to their init line:
	this setVariable ["HelpCalled",false]
To register a mortar as available for flares and strikes then add this to their init line:
	this setVariable ["RegisterMortar",true];
*/

if (isServer) then {
	if (is3DENPreview) then {systemChat "Reiforcement System Initiliasing"};
	//Spawn a Game Logic to act as reinforcement controller and broadcast the identity to clients
	_logicCenter = createCenter sideLogic;
	_logicGroup = createGroup _logicCenter;
	_reinforceLogic = _logicGroup createUnit ["Logic", [0,0,0], [], 0, "NONE"];
	_reinforceLogic setVehicleVarName "ReinforceLogic";
	missionNamespace setVariable ["ReinforceLogic", _reinforceLogic, true];
	if (is3DENPreview) then {systemChat "Reiforcement Logic Successfully Created"};

	//Create neccessary variables, kept locally on the server
	_reinforcementsRemaining = ["AvailableReinforcements", 5] call BIS_fnc_getParamValue;
	ReinforceLogic setVariable ["Callouts",[]];
	ReinforceLogic setVariable ["Active",true];

	//Check if the mortar system should be used
	_useMortars = 0;//["UseMortars", false] call BIS_fnc_getParamValue;
	if (_useMortars == 1) then {ReinforceLogic setVariable ["Mortars",[]];};
	if (is3DENPreview && (_useMortars == 1)) then {systemChat "Mortar Support System Initialised"} else {systemChat "Mortar Support Disabled"};

	//Calls the road registration function
	_roadLocations = [] call BLU_fnc_getRoads;
	ReinforceLogic setVariable ["Roads",_roadLocations];

	//Begins the ReinforcementLogic Loop
	null = [_useMortars,_reinforcementsRemaining] spawn BLU_fnc_reinforcementController;

	//Runs through all units to check if they have been registered as a reinforcement RegisterCaller or a mortar
	{
		if (((side _x) == east) && !(isNil{_x getVariable "RegisterCaller"})) then {
			_caller = _x getVariable "RegisterCaller";
			[_x,_caller] spawn BLU_fnc_registerCaller; 
		};
		
		//Handles the registration and initlialisation of mortar units
		if ((_useMortars == 1) && (vehicle _x != _x) && (vehicle _x isKindOf "StaticMortar") && !(isNil{(vehicle _x) getVariable "Status"})) then {
			_status = (vehicle _x) getVariable "Status";
			_update = ReinforceLogic getVariable "Mortars";
			_update append [[_x,_status]];
			_x addEventHandler ["Killed", {
				params ["_unit"];
				_update = ReinforceLogic getVariable "Mortars";
				_entry = _update findIf {(_x select 0) == _unit};
				(_update select _entry) set [1,"DISABLED"];
			}];
			_x addEventHandler ["GetOutMan", {
				params ["_unit"];
				_update = ReinforceLogic getVariable "Mortars";
				_entry = _update findIf {(_x select 0) == _unit};
				(_update select _entry) set [1,"DISABLED"];
			}];
			_x addEventHandler ["GetInMan", {
				params ["_unit"];
				_update = ReinforceLogic getVariable "Mortars";
				_entry = _update findIf {(_x select 0) == _unit};
				(_update select _entry) set [1,"READY"];
			}];
		};
	} forEach allUnits;
	if (is3DENPreview) then {systemChat "Reinforcement System Initliasation Complete"};
};