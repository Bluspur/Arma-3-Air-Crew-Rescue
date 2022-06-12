if(!isServer) exitWith {};

//Playable Groups
_playableGroups = [GER_SQUAD_ONE,GER_SQUAD_TWO,CZE_SQUAD_ONE,CZE_SQUAD_TWO];
_playerlessGroups = [];

//Setup for Single-Player
if (!isMultiplayer) exitWith {
	{
		deleteVehicle _x;
	} forEach ((units GER_SQUAD_TWO) + (units CZE_SQUAD_ONE));
	deleteGroup GER_SQUAD_TWO;
	deleteGroup CZE_SQUAD_ONE;
	(units CZE_SQUAD_TWO) joinSilent player;
	deleteGroup CZE_SQUAD_TWO; 
};

//Get players
_headlessClients = entities "HeadlessClient_F";
_allPlayers = allPlayers - _headlessClients;

//Checks group leaders
{
	//Check if they are the squad leader
	_isLeader = [_x] call BLU_fnc_getIsLeader;
	if (!_isLeader) then {
		//Check if the current squad Leader is a player
		_isLeaderPlayer = [leader group _x] call BLU_fnc_getIsPlayer;
		if (!_isLeaderPlayer) then {
			//Sets player as squad leader
			[group _x, _x] remoteExec ["selectLeader", groupOwner group _x];
		};
	};
} forEach _allPlayers;

//Check for playerless groups
{
	_hasPlayer = (units _x) findIf {_x call BLU_fnc_getIsPlayer};
	if (_hasPlayer == -1) then {
		_playerlessGroups pushBack _x;
	};
} forEach _playableGroups;

//Join playerless groups to their national other group
{
	switch (_x) do {
		case GER_SQUAD_ONE: {
			(units GER_SQUAD_ONE) joinSilent GER_SQUAD_TWO;
			_counterpartIndex = _playerlessGroups findIf {_x == GER_SQUAD_TWO};
			if (_counterpartIndex != -1) then {
				_playerlessGroups set [_counterpartIndex,grpNull];
			};
		};
		case GER_SQUAD_TWO: { 
			(units GER_SQUAD_TWO) joinSilent GER_SQUAD_ONE;
			_counterpartIndex = _playerlessGroups findIf {_x == GER_SQUAD_ONE};
			if (_counterpartIndex != -1) then {
				_playerlessGroups set [_counterpartIndex,grpNull];
			};
		};
		case CZE_SQUAD_ONE: {
			(units CZE_SQUAD_ONE) joinSilent CZE_SQUAD_TWO;
			_counterpartIndex = _playerlessGroups findIf {_x == CZE_SQUAD_TWO};
			if (_counterpartIndex != -1) then {
				_playerlessGroups set [_counterpartIndex,grpNull];
			};
		};
		case CZE_SQUAD_TWO: { 
			(units CZE_SQUAD_TWO) joinSilent CZE_SQUAD_ONE;
			_counterpartIndex = _playerlessGroups findIf {_x == CZE_SQUAD_ONE};
			if (_counterpartIndex != -1) then {
				_playerlessGroups set [_counterpartIndex,grpNull];
			};
		};
		default {};
	};
} forEach _playerlessGroups;