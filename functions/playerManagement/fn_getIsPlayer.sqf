if (!isServer) exitWith {};

params ["_testedUnit"];

//init
_isPlayer = false;

//Get players
_headlessClients = entities "HeadlessClient_F";
_allPlayers = allPlayers - _headlessClients;

//Check
_isPlayer = _testedUnit in _allPlayers;

//Return
_isPlayer;