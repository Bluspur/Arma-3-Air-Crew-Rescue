if (!isServer) exitWith {};
params ["_target"];

[
	_target,
	"<t color='#317ba5'>Investigate Laptop</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa",
	"_this distance _target < 3",						// Condition for the action to be shown
	"_caller distance _target < 3",						// Condition for the action to progress
	{_target setObjectTextureGlobal [1, "textures\LaptopTwo.jpg"];}, // Code executed when action starts
	{},													// Code executed on every progress tick
	{
		_target setObjectTextureGlobal [1, "textures\LaptopOne.jpg"]; 
		null = [_caller] remoteExecCall ["BLU_fnc_markPrison",2];
		null = [(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove", [0,-2] select isDedicated,true];
	}, // Code execute on success
	{_target setObjectTextureGlobal [1, "textures\LaptopOne.jpg"];},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration [s]
	0,													// Priority
	true,												// Remove on completion
	false												// Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd", 0, _target];