params ["_hostageGroup"];

private _animations = [
	"Acts_AidlPsitMstpSsurWnonDnon01",
	"Acts_AidlPsitMstpSsurWnonDnon02",
	"Acts_AidlPsitMstpSsurWnonDnon03",
	"Acts_AidlPsitMstpSsurWnonDnon04",
	"Acts_AidlPsitMstpSsurWnonDnon05"
];

private _blindfolds = [
	"G_Blindfold_01_black_F",
	"G_Blindfold_01_white_F"
];

{
	if (alive _x) then {
		//Prep the unit for being a hostage
		removeAllItems _x;
		removeAllWeapons _x;
		removeHeadgear _x;
		removeGoggles _x;
		removeBackpack _x;
		removeVest _x;
		_x addGoggles (selectRandom _blindfolds);
		_x setCaptive true;
		_x setDamage (random 0.4);
		_x disableAI "MOVE";
		_x disableAI "ANIM";
		_x disableAI "AUTOTARGET";
		_x disableAI "RADIOPROTOCOL";
		_x allowFleeing 0;
		_x setBehaviour "CARELESS";
		//Randomly selects an animation
		_anim = selectRandom _animations;
		null = [_x,_anim] remoteExec ["switchMove", 0, _x];
		null = [
			_x,
			"Free Hostage",
			"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
			"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
			"(_this distance _target) < 5 && alive _target",
			"true",
			{},
			{},
			{
				if (_this select 3 select 0 == "Acts_ExecutionVictim_Loop") then {
					null = [(_this select 0),"Acts_ExecutionVictim_Unbow"] remoteExec ["playMove", 2, false];
				} else {
					null = [(_this select 0),"Acts_AidlPsitMstpSsurWnonDnon_out"] remoteExec ["switchMove", 0, false];
				};
				_complMessage = selectRandom [
				
					"I thought I was gonna die in here!",
					"Thank you so much man.",
					"Let's get the FUCK out of here!",
					"Where the hell am I?",
					"I didn't think I was going to make it...",
					"Those fucking rebels are going to pay!"
				];
				removeGoggles (_this select 0);					
				null = ["Hostage", _complMessage] call BIS_fnc_showSubtitle;
				[] remoteExecCall ["BLU_fnc_incrementCrewCounter",2];
				(_this select 0) addMPEventHandler ["MPKilled",{[] remoteExecCall ["BLU_fnc_decrementCrewCounter",2]}];
				sleep 5.5;
				null = [(_this select 0),"MOVE"] remoteExec ["enableAI", 2, false];
				null = [(_this select 0),"AUTOTARGET"] remoteExec ["enableAI", 2, false];
				null = [(_this select 0),"ANIM"] remoteExec ["enableAI", 2, false];
				null = [(_this select 0),"SAFE"] remoteExec ["setBehaviour", 2, false];
				null = [(_this select 0),"RADIOPROTOCOL"] remoteExec ["enableAI", 2, false];
				null = [(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove", [0,-2] select isDedicated,true];
				[(_this select 0)] join (group (_this select 1));
				(_this select 0) setCaptive false;
			},
			{
				_intrMessage = selectRandom [
					"Hey! I don't wanna die here!",
					"Don't leave me here man! Please!",
					"*Mumbles* Shit shit shit...",
					"Please! I want to go home!"
				];
				null = ["Hostage", _intrMessage] call BIS_fnc_showSubtitle;
			},
			[_anim],
			3,
			10,
			true,
			false
		] remoteExec ["bis_fnc_holdActionAdd", [0,-2] select isDedicated, _x];
		_x addMPEventHandler ["MPKilled", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			[_unit,_instigator] remoteExecCall ["BLU_fnc_updateCrewStatusDead",2];
			[
				_unit,
				"<t color='#317ba5'>Recover Dog Tags</t>",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
				"_this distance _target < 3",						// Condition for the action to be shown
				"_caller distance _target < 3",						// Condition for the action to progress
				{}, // Code executed when action starts
				{},													// Code executed on every progress tick
				{[] remoteExecCall ["BLU_fnc_incrementCrewCounter",2];[_this select 0,_this select 2] remoteExec ["BIS_fnc_holdActionRemove",0,true];}, // Code execute on success
				{},													// Code executed on interrupted
				[],													// Arguments passed to the scripts as _this select 3
				2,													// Action duration [s]
				10,													// Priority
				true,												// Remove on completion
				false												// Show in unconscious state 
			] remoteExec ["BIS_fnc_holdActionAdd", [0,-2] select isDedicated, _unit];
		}];
	}
	else 
	{
		[
			_x,
			"<t color='#317ba5'>Recover Dog Tags</t>",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
			"_this distance _target < 3",						// Condition for the action to be shown
			"_caller distance _target < 3",						// Condition for the action to progress
			{}, // Code executed when action starts
			{},													// Code executed on every progress tick
			{[] remoteExecCall ["BLU_fnc_incrementCrewCounter",2];[_this select 0,_this select 2] remoteExec ["BIS_fnc_holdActionRemove",0,true];}, // Code execute on success
			{},													// Code executed on interrupted
			[],													// Arguments passed to the scripts as _this select 3
			2,													// Action duration [s]
			10,													// Priority
			true,												// Remove on completion
			false												// Show in unconscious state 
		] remoteExec ["BIS_fnc_holdActionAdd", [0,-2] select isDedicated, _x];
	};
} forEach _hostageGroup;


