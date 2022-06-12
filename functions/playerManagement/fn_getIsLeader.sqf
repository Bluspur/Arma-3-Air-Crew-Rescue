if(!isServer) exitWith {/*only for players*/};

params ["_player"];

_isLeader = false;

//Are they the group leader
if (leader (group _player) == _player) then {
	_isLeader = true;
} else {
	_isLeader = false;
};

_isLeader;