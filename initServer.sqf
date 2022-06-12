//Sets up the hostage objective
null = [[crew_1, crew_2, crew_3]] spawn BLU_fnc_initHostage;
//Sets up the Laptop objective
null = [Objective_Laptop] spawn BLU_fnc_initLaptop;

//Objective Variables
missionNamespace setVariable ["CrewCounter",0];
missionNamespace setVariable ["CrewStatus",[]];
missionNamespace setVariable ["PendingRequests", []];

//Starts the Site Manager System
null = [] spawn BLU_fnc_siteManager;
//Initialise the Reinforcement System
null = [] call BlU_fnc_initReinforceSystem;
//Begins the task flow system
null = [crew_1, crew_2, crew_3] spawn BLU_fnc_missionFlow;
//Civilian Death Counter (Killed by Blufor not just Players)
missionNamespace setVariable ["CivilianDeaths",0];
//Organises Player Groups
null = [] call BLU_fnc_organiseGroup;
//Handles the intro
[] remoteExec ["BLU_fnc_introText",0];
//Begins the BIS function that handles the Opfor Skill levels
null = [true,[[EAST,0.3,0.2,0.7,0.4]]] call BIS_fnc_EXP_camp_dynamicAISkill;

//RESPAWNING
//Sets the initial respawn position
[getMarkerPos "start_respawn","Motor Pool"] remoteExecCall ["BLU_fnc_addLocalRespawn", [0,-2] select isDedicated, true];
//Inits respawn tickets
_tickets = ["RespawnTickets", 16] call BIS_fnc_getParamValue;
[west, _tickets] call BIS_fnc_respawnTickets;
//Inits the respawn loadouts
null = [] call BLU_fnc_initLoadouts;
//Adds an event handler so that if an AI respawns it is removed instead of coming back
{
    _x addMPEventHandler ["MPRespawn", {
    	_unit = _this select 0;
    	if (!isPlayer _unit) exitWith {
        	deleteVehicle _unit
    	}
    }
]} forEach playableUnits;