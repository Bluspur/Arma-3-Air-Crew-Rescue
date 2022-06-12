//Where will they spawn
_origin = selectRandom (missionNamespace getVariable "ReinforcementOrigins");

//Get config references
_configTransports = getArray (missionConfigFile >> "unitPool" >> "transports" >> "pool");
_configUnits = getArray (missionConfigFile >> "unitPool" >> "cargo" >> "pool");

//In which vehicle
_transportClass = selectRandomWeighted _configTransports;
_availableSeats = [_transportClass, true] call BIS_fnc_crewCount;

//Spawns the vehicle
_spawnedTransport = _transportClass createVehicle (getMarkerPos _origin);

//Spawns enough crewmen to fill the spawned vehicle
_group = createGroup East;
for [{_i = 0}, {_i < _availableSeats}, {_i = _i + 1}] do {
	_x = 0;
	//Checks to see if there are more available seats than units in the pool, it overflows the array
	if (_i > (count _configUnits - 1)) then {
		_x = _i - (count _configUnits);
	} else {
		_x = _i;
	};
	_unit = _group createUnit [(_configUnits select _x),(getMarkerPos _origin),[],0,"NONE"];
	_unit moveInAny _spawnedTransport;
};

//Connects the group and the vehicle together
_group addVehicle _spawnedTransport;
units _group orderGetIn true;

//Dynamic Simulation
{
	_x triggerDynamicSimulation false;
} forEach units _group;
_spawnedTransport triggerDynamicSimulation false;

//Variables to be passed out
_output = [_group,_spawnedTransport];
_output;