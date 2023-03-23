params["_vehicle", "_lootDistance"];

_invisibleContainers = []; 
// Loot from bodies, usually primary weapon and launcher
_invisibleContainers append (_vehicle nearObjects ["WeaponHolderSimulated", _lootDistance]);
// Loot dropped on the ground.
// Despite the name, WeaponHolder contains all kinds of items, not just weapons.
_invisibleContainers append (_vehicle nearObjects ["WeaponHolder", _lootDistance]);
{
	_container = _x;	
	
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
	clearWeaponCargoGlobal _container;
	clearMagazineCargoGlobal _container;
	clearItemCargoGlobal _container;
	clearBackpackCargoGlobal _container;
} forEach _invisibleContainers;

count _invisibleContainers; // Return