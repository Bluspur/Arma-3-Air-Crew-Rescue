_callerUnit = _this select 0;
_callerArea = _this select 1;
_detectionTime = ["DetectionTime", 3] call BIS_fnc_getParamValue; //seconds
_resetTime = ["ResetTime", 10] call BIS_fnc_getParamValue; //minutes

//Switches
_waiting = false;
_alerted = false;

//Variables for determining wait times
_lastDetectedTime = 0;
_lastReportTime = 0;

//To be evaluated against the caller area
_hasHelpBeenCalled = false;

//Target info to be sent with the request
_selectedTarget = [];

if (is3DENPreview) then {systemChat format ["%1 Successfully Registered as Reinforcement Caller at %2", _callerUnit, _callerArea]};

while {sleep 1; alive _callerUnit && ReinforceLogic getVariable "Active"} do {

	//Get the Caller Areas current status
	_hasHelpBeenCalled = _callerArea getVariable "HelpCalled";

	//Get a roll-call of players
	_allPlayers = call BIS_fnc_listPlayers;

	//Measures the current difference in time between now and when the last report was sent
	_lastReportTimeDifference = [_lastReportTime, time] call BLU_fnc_getTimeDifference;
	
	if (_waiting && (_lastReportTimeDifference > (_resetTime * 60))) then {
		_waiting = false;
		if (is3DENPreview) then {systemChat format ["Alert Status reset for %1 at %2",_callerUnit,_callerArea]};
	};

	if (!_waiting && !_hasHelpBeenCalled) then {
		//Iterate through all player group units to see if the caller knows about them
		{
			{
				_targetInfo = _callerUnit targetKnowledge _x;
				_knowledgeAge = [_targetInfo select 3, time] call BLU_fnc_getTimeDifference;
				if ((_targetInfo select 1) && !_alerted && (_targetInfo select 3 > 0) && (_knowledgeAge < 300)) then {
					_selectedTarget = _targetInfo;
					_lastDetectedTime = time;
					_alerted = true;
				};
			} forEach units group _x;
		} forEach _allPlayers;
	};

	//Final Check to see if the caller has survived the required time before sending the call
	_detectedTime = [_lastDetectedTime, time] call BLU_fnc_getTimeDifference;
	if (_alerted && !_waiting && (_detectedTime > _detectionTime)) then {
		if (!_hasHelpBeenCalled) then {
			_callerArea setVariable ["HelpCalled",true];
			_waiting = true;
			null = [_callerArea,(_selectedTarget) select 6] call BLU_fnc_sendCall;
			if (is3DENPreview) then {systemChat format ["%1 Successfully Sent Call from %2",_callerUnit,_callerArea]};
		} else {
			_alerted = false;
			if (is3DENPreview) then {systemChat format ["%1 Made a Reinforcement Request at %2 but it was denied due to an existing request.",_callerUnit,_callerArea]};
		};

	};
	/*

	};*/
};

if (is3DENPreview) then {systemChat format ["%1 caller script ending at %2",_callerUnit, _callerArea]};