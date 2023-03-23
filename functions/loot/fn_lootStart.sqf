_vehicle = _this; // Parameter

// Keep track of how many backpacks are already in the vehicle,
// so that their inventory is not deleted.
_previousBackpacksCount = count backpackCargo _vehicle;

// Loot
_lootDistance = LootToVehicle_lootDistance;
hint str _lootDistance; sleep 5;
_countBodies = [_vehicle, _lootDistance] call LootToVehicle_fnc_lootBodies;
_countGround = [_vehicle, _lootDistance] call LootToVehicle_fnc_lootGround;

// All items are looted,
// but only number of bodies and items directly on the ground are counted.
_foundLoot = ( (_countBodies + _countGround) > 0 );
if(_foundLoot) then {
	// Some backpacks contain items by default when created, remove those items.
	[_previousBackpacksCount, _vehicle] call LootToVehicle_fnc_emptyAddedBackpacks;

	[_countBodies, _countGround] call LootToVehicle_fnc_hintSuccess;
}
else{
	call LootToVehicle_fnc_hintNotFound;
};