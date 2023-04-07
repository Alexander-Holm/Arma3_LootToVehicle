private _bodiesCount = _this;

_maxTime = LootToVehicle_TimeMax; // CBA setting
_lootTimeBody = LootToVehicle_TimeBody; // CBA setting
_lootTimeTotal = _bodiesCount * _lootTimeBody;
// Adjust both total loot time and time per body if
// total time is more than max time from settings.
if(_lootTimeTotal > _maxTime) then {
	_lootTimeTotal = _maxTime;
	_lootTimeBody = _maxTime / _bodiesCount;
};

[_lootTimeTotal, _lootTimeBody]; // Return