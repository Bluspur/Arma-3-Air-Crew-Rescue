if(!isServer) exitWith {/*GET THE FUCK OUT OF HERE CLIENT BASTARD*/}

params ["_crewArray"];
_roleOfShame = [];
_numberCrewAlive = 0;
_numberCrewDead = 0;

_crewStatusArray = missionNamespace getVariable "CrewStatus";
{
	_status = _x select 1;
	switch (_status) do {
		case -1: {
			_roleOfShame pushBack [(_x select 2),(_x select 0)];
			_numberCrewDead = _numberCrewDead + 1;
		};
		case 0: {
			_numberCrewDead = _numberCrewDead + 1;
		};
		case 1: {
			_numberCrewAlive = _numberCrewAlive + 1;
		};
		default {if(is3DENPreview) then {systemChat "Error when counting Crewmen"}};
	};
} forEach _crewStatusArray;

//Creates an array of player criminals with an array of format [player,victim,victim...]
_headlessClients = entities "HeadlessClient_F";
_allPlayers = allPlayers - _headlessClients;
_crimeArray = [];
{
	_player = _x;
	_crimeArrayElement = [];
	{
		_report = _x;
		if (_report select 0 == _player) then {
			_crimeArrayElement pushBackUnique _player;
			_crimeArrayElement pushBack (_report select 1);
		}
	} forEach _roleOfShame;
	if (count _crimeArrayElement > 0) then {
		_crimeArray pushBack _crimeArrayElement;
	};
} forEach _allPlayers;

_statements = []; //Array of strings to be printed on the final slide

_titleCrimes = formatText ["<t underline='1'>Inditements:</t>"];
_statements pushBack _titleCrimes;

//Generates StructuredText if players killed Hostages
if (count _crimeArray > 0) then {
	{
		if (count _x < 3) then {
			_text = formatText [
				"%1%2%3 will appear before the %4Court Martial%5 to answer for the murder of %6%7 %8%9.",
				"<t color='#0099ff'>",
				name (_x select 0),
				"</t>",
				"<t color='#ff4d4d'>",
				"</t>",
				"<t color='#70db70'>",
				[(rank (_x select 1))] call BLU_fnc_toLowerNoun,
				name (_x select 1),
				"</t>"];
			_statements pushBack _text;
		};
		if (count _x == 3) then {
			_text = formatText [
				"%1%2%3 will appear before the %4Court Martial%5 to answer for the murders of %6%7 %8%9 and %10%11 %12%13.",
				"<t color='#0099ff'>",
				name (_x select 0),
				"</t>",
				"<t color='#ff4d4d'>",
				"</t>",
				"<t color='#70db70'>",
				[(rank (_x select 1))] call BLU_fnc_toLowerNoun,
				name (_x select 1),
				"</t>",
				"<t color='#70db70'>",
				[(rank (_x select 2))] call BLU_fnc_toLowerNoun,
				name (_x select 2),
				"</t>"];
			_statements pushBack _text;
		};
		if (count _x > 3) then {
			_text = formatText [
				"%1%2%3 will appear before the %4Court Martial%5 to answer for the murders of %6%7 %8%9, ",
				"<t color='#0099ff'>",
				name (_x select 0),
				"</t>",
				"<t color='#ff4d4d'>",
				"</t>",
				"<t color='#70db70'>",
				[(rank (_x select 1))] call BLU_fnc_toLowerNoun,
				name (_x select 1),
				"</t>"];
			for [{_i = 2}, {_i < (count _x) - 1}, {_i = _i + 1}] do {
				_addText = formatText [
					"%1%2 %3%4, ",
					"<t color='#70db70'>",
					[(rank (_x select _i))] call BLU_fnc_toLowerNoun,
					name (_x select _i),
					"</t>"];
				_text = _text + _addText;
			};
			_finalIndex = (count _x - 1);
			_addText = formatText [
				"and %1%2 %3%4.",
				"<t color='#70db70'>",
					[(rank (_x select _finalIndex))] call BLU_fnc_toLowerNoun,
					name (_x select _finalIndex),
					"</t>"];
			_text = _text + _addText;
			_statements pushBack _text;
		};
	} forEach _crimeArray;
};

//Handles the text regarding civilians
_civiliansKilled = missionNamespace getVariable "CivilianDeaths";
if (_civiliansKilled > 0) then {
	if (_civiliansKilled < 2) then {
		_addText = formatText ["During the course of the operation %1%2 civilian%3 was killed by Coalition forces.%4Expect a throrough investigation!","<t color='#ff4dff'>",_civiliansKilled,"</t>","<br/>"];
		_statements pushBack _addText;
	} else {
		_addText = formatText ["During the course of the operation %1%2 civilians%3 were killed by Coalition forces.%4Expect a throrough investigation!","<t color='#ff4dff'>",_civiliansKilled,"</t>","<br/>"];
		_statements pushBack _addText;
	};
} else {
	_addText = formatText ["You completed the mission without any %1civilian%2 casualties. Excellent work!","<t color='#ff4dff'>","</t>"];
	_statements pushBack _addText;
};

//Builds the final output text
_finalText = "<br/>";
_statementCount = count _statements;
for [{_i = 0}, {_i < _statementCount}, {_i = _i + 1}] do {
	_finalText = format ["%1%2%3%4",_finalText,(_statements select _i), "<br/>", "<br/>"];
};
//Sets the text as final!
missionNamespace setVariable ["EvaluationText",_finalText];

{
	_isCriminal = -1;
	//Check if they are dead and if so send them the dead ending
	if (!alive _x) then {
		if (_numberCrewAlive > 0) then {
			["EndWinDead",true] remoteExecCall ['BIS_fnc_endMission',_x];
		} else {
			["EndLoseDead",false] remoteExecCall ['BIS_fnc_endMission',_x];
		};
	} else {
		//Is the player a murderer?
		_player = _x;
		_isCriminal = _crimeArray findIf {(_x select 0) == _player};
		if (_isCriminal != -1) then {
			if (_numberCrewAlive > 0) then {
				["EndWinMurderer",true] remoteExecCall ['BIS_fnc_endMission',_x];
			} else {
				["EndLoseMurderer",false] remoteExecCall ['BIS_fnc_endMission',_x];
			};
		} else {
			switch (_numberCrewAlive) do {
				case 0: { ["EndLose",false] remoteExecCall ['BIS_fnc_endMission',_x];};
				case 1: { ["EndWinPartial",true] remoteExecCall ['BIS_fnc_endMission',_x];};
				case 2: { ["EndWinTotal",true] remoteExecCall ['BIS_fnc_endMission',_x];};
			};
		};
	};
} forEach _allPlayers;

true;