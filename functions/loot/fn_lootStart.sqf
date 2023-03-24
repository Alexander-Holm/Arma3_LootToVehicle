_vehicle = _this; // Parameter

// Keep track of how many backpacks are already in the vehicle,
// so that their inventory is not deleted.
_previousBackpacksCount = count backpackCargo _vehicle;

// Loot
// All items are looted,
// but only number of bodies and items directly on the ground are counted.
_lootDistance = LootToVehicle_LootDistance;
[_vehicle, _lootDistance] call LootToVehicle_fnc_lootGround
	params ["_groundCount", "_lootedAllGround"]; // Returned values
[_vehicle, _lootDistance] call LootToVehicle_fnc_lootBodies
	params ["_bodiesCount", "_lootedAllBodies"]; // Returned values

_vehicleIsFull = _lootedAllGround == false || _lootedAllBodies == false;
_lootedAnything = ( (_groundCount + _bodiesCount) > 0 );
_lootedEverything = _lootedAnything && _vehicleIsFull == false;
_noLootFound = _lootedAnything == false && _vehicleIsFull == false;

if(_lootedAnything) then {
	// Some backpacks contain items by default when created, remove those items.
	[_previousBackpacksCount, _vehicle] call LootToVehicle_fnc_emptyAddedBackpacks;
};

// Display notification
if(_lootedEverything) then{
	["LootToVehicle_Success"] call BIS_fnc_showNotification;
};
if(_vehicleIsFull) then{
	["LootToVehicle_FullInventory"] call BIS_fnc_showNotification;
};
if(_noLootFound) then{
	["LootToVehicle_NotFound", [round _lootDistance]] call BIS_fnc_showNotification;
};