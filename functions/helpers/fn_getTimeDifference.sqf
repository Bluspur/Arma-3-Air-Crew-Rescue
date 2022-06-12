params ["_referenceTime","_currentTime"];
_deltaTime = 0;

_deltaTime = _currentTime - _referenceTime;
floor _deltaTime;