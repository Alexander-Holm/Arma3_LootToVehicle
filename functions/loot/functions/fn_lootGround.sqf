params["_vehicle", "_lootDistance"];

// Find loot
_invisibleContainers = []; 
// Loot from bodies, usually primary weapon and launcher
_invisibleContainers append (_vehicle nearObjects ["WeaponHolderSimulated", _lootDistance]);
// Loot dropped on the ground.
// Despite the name, WeaponHolder contains all kinds of items, not just weapons.
_invisibleContainers append (_vehicle nearObjects ["WeaponHolder", _lootDistance]);

// Loot
_lootedCount = 0;
_lootedAll = true;
{
	_container = _x;	

	if(_vehicle call LootToVehicle_fnc_isVehicleFull) exitWith{
		_lootedAll = false;
	};	
	
	// Loot all items, except those inside uniform, vest, or backpack
	[_container, _vehicle] call LootToVehicle_fnc_lootContainer;

	// Loot content inside uniform, vest, or backpack
	_equipmentWithInventory = everyContainer _container;
	{
		// everyContainer return format: [container className, actual container]
		// select 1 to get container
		_equipment = _x select 1;
		[_equipment, _vehicle] call LootToVehicle_fnc_lootContainer;
	} forEach _equipmentWithInventory;

	//Remove looted items from the gorund
	_container call LootToVehicle_fnc_clearContainer;

	_lootedCount = _lootedCount + 1;
} forEach _invisibleContainers;

[_lootedCount, _lootedAll]; // Return