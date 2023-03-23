params["_vehicle", "_lootDistance"];

_EMPTY_LOADOUT = configFile >> "EmptyLoadout";

// Find nearby bodies with loot
_allDead = allDeadMen;
_lootableBodies = [];
{ 
	_body = _x;
	_inLootDistance = _body distance (position _vehicle) <= _lootDistance;
	_hasLoot = (getUnitLoadout _body) isNotEqualTo (getUnitLoadout _EMPTY_LOADOUT);
	if(_inLootDistance && _hasLoot) then{
		_lootableBodies append [_body];
	};
} forEach _allDead;

// Loot bodies
{
	_body = _x;

	_weapons = weaponsItems _body;
	_equipmentWithInventory = [
		uniformContainer _body,
		vestContainer _body,
		backpackContainer _body
	];
	_items = [
		uniform _body, // Not inventory
		vest _body, // Not inventory
		headgear _body,
		goggles _body
		// Not backpack, it has to be added separately
	];
	// [<Map>, <Compass>, <Watch>, <Radio>, <GPS>, <NVG>, <Binoculars>]
	// Includes binoculars / rangefinder WITHOUT batteries
	_items append (assignedItems _body);
	_items append (binocularMagazine _body); // Get batteries

	// Loot all items, except weapons and items inside uniform, vest, or backpack
	{ _vehicle addItemCargoGlobal [_x, 1]; } forEach _items;
	// Loot content inside uniform, vest, or backpack
	{ [_x, _vehicle] call LootToVehicle_fnc_lootContainer; } forEach _equipmentWithInventory;
	// Loot weapons with current attachments and ammo
	// Primary and secondary (launcher) usually drop to the ground,
	// and will not be looted from the body.
	{ _vehicle addWeaponWithAttachmentsCargoGlobal [_x, 1]; } forEach _weapons;
	// Add backpack to vehicle
	// Some backpacks contain items by default when created, remove those items later.
	_backpackClass = backpack _body;
	_hasBackpack = (count _backpackClass) > 0;
	if (_hasBackpack) then {
		_vehicle addBackpackCargoGlobal [_backpackClass, 1];
	};
	
	// Remove all items from body
	_body setUnitLoadout _EMPTY_LOADOUT;
} forEach _lootableBodies;

count _lootableBodies; // Return