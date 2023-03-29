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
_lootedCount = 0;
_lootedAll = true;
{
	_body = _x;	

	if(_vehicle call LootToVehicle_fnc_isVehicleFull) exitWith{
		_lootedAll = false;
	};	
	
	// Loot all items except weapons, backpack, and items inside uniform, vest, or backpack
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
	{ _vehicle addItemCargoGlobal [_x, 1]; } forEach _items;


	// Loot content inside uniform, vest, or backpack
	// These have to be looted and emptied before weaponsItems is used.
	// That's because weaponsItems also includes weapons inside backpacks etc.
	_equipmentWithInventory = [
		uniformContainer _body,
		vestContainer _body,
		backpackContainer _body
	];
	{ 
		[_x, _vehicle] call LootToVehicle_fnc_lootContainer;
		// Have to empty the container, otherwise weapons inside will get looted twice.
		_x call LootToVehicle_fnc_clearContainer;
	} forEach _equipmentWithInventory;


	// Loot weapons with current attachments and ammo
	// Primary and secondary (launcher) usually drop to the ground.
	// Bodies inside vehicles keep their weapons on them.

	// Remove binoculars since they count as a weapon but have already been looted
	_body removeWeapon binocular _body;
	// Weapons inside backpacks etc. should have been removed at this step,
	// otherwise they will get looted twice.
	_weapons = weaponsItems _body;
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

	_lootedCount = _lootedCount +1;
} forEach _lootableBodies;

[_lootedCount, _lootedAll]; // Return