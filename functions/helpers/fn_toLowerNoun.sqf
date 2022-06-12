params ["_string"];

//Seperates the string
_startLetter = _string select [0,1];
_restString = _string select [1];

//To lowers the rest of the word
_restString = toLowerANSI _restString;
_string = _startLetter + _restString;

_string;