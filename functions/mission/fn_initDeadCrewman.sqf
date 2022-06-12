params ["_man"];

_man setCaptive true;
_man setDamage 1;
[_man, "Acts_StaticDeath_03"] remoteExec ["switchMove", 0];