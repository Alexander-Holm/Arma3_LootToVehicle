player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if(_role != "driver") exitWith {nil};

	[_unit, _vehicle] call LootToVehicle_fnc_createScrollmenuItem;

	_unit addEventHandler ["GetOutMan", {
		params ["_unit"];
		_unit call LootToVehicle_fnc_removeScrollmenuItem;
	}];
}];