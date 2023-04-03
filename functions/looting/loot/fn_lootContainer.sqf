// Container can be equipment with inventory like backpack etc.
// or a "WeaponHolder" that contains weapons and items on the ground.
params ["_container", "_vehicle"];

_vehicle call LootToVehicle_fnc_validateContinue;

// Uniform, vest, and backpack are containers and if they are on
// the ground in a WeaponHolder they can contain other items.
// Items inside these should be looted first 
// to prevent duplicates when looting is exited early.
private _nestedContainers = everyContainer _container;
{	
	// everyContainer return format: [container className, actual container]
	// select 1 to get container
	[_x select 1, _vehicle] call LootToVehicle_fnc_lootContainer;
} forEach _nestedContainers;

// Loot top level items
{ _vehicle addWeaponWithAttachmentsCargoGlobal [_x, 1] } forEach weaponsItemsCargo _container;
{ _vehicle addMagazineCargoGlobal [_x, 1] } forEach magazineCargo _container;
{ _vehicle addItemCargoGlobal [_x, 1] } forEach itemCargo _container;
{ [_vehicle, _x] call LootToVehicle_fnc_addBackpack; } forEach backpackCargo _container;


_container call LootToVehicle_fnc_clearContainer;