player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if(_role != "driver") exitWith {nil};

	_onScrollmenuClick = {
		_vehicle = _this; // Parameter

		_lootDistance = 100;
		// Keep track of how many backpacks are already in the vehicle,
		// so that their inventory is not deleted.
		_previousBackpacksCount = count backpackCargo _vehicle;

		[_vehicle, _lootDistance] call LootToVehicle_fnc_lootBodies;
		[_vehicle, _lootDistance] call LootToVehicle_fnc_lootGround;
		// Some backpacks contain items by default when created, remove those items.
		[_previousBackpacksCount, _vehicle] call LootToVehicle_fnc_emptyAddedBackpacks;
	};
	
	// Create scrollmenu item
	[_unit, _onScrollmenuClick, _vehicle] call LootToVehicle_fnc_createScrollmenuItem;

	_unit addEventHandler ["GetOutMan", {
		params ["_unit"];
		// Remove scrollmenu item
		_unit call LootToVehicle_fnc_removeScrollmenuItem;
	}];
}];