params ["_mortarsActive","_reinforcementsRemaining"];

if (is3DENPreview) then {systemChat "Reinforcement Controller Starting"};

while {sleep 2; _reinforcementsRemaining >= 0} do {
	_currentCallouts = ReinforceLogic getVariable "Callouts";
	{
		_x params ["_callerArea","_target"];
		_group = [];
		
		//Extra check for reinforcement ticket count
		if (_reinforcementsRemaining <= 0) exitWith {};
		
		//Spawn Group
		_group = [] call BLU_fnc_spawnReinforcements;
		
		//Dispatch Group
		[(_group select 0),(_group select 1),_target] spawn BLU_fnc_sendReinforcements;
		_reinforcementsRemaining = _reinforcementsRemaining - 1;
		if (is3DENPreview) then {systemChat format ["%1 dispatched in %2 to %3. %4 reinforcement groups remaining.",(_group select 0),(_group select 1),_target,_reinforcementsRemaining]};
		_callerArea getVariable ["HelpCalled",false];

		//Mortars
		if (_mortarsActive == 1) then {
			_mortars = ReinforceLogic getVariable "Mortars";
			_selectedMortarID = _mortars findIf {(_x select 1) == "READY"};
			if (_selectedMortarID != -1) then {
				//Reserve the mortar
				(_mortars select _selectedMortarID) set [1,"BUSY"];
				_selectedMortar = _mortars select _selectedMortarId;
				[(_selectedMortar select 0),_locationMarker,_selectedMortarId,"8Rnd_82mm_Mo_Flare_white",2,10,20] spawn BLU_fnc_fireMission;
			};
		};

		_currentCallouts deleteAt _forEachIndex;
		
	} forEach _currentCallouts;
};

if (is3DENPreview) then {systemChat "Reinforcements Depleted, Controller Exiting"};