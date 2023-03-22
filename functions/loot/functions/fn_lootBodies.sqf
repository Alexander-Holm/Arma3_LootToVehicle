params["_vehicle", "_lootDistance"];

_allDead = allDeadMen;
_nearbyBodies = [];
// Find nearby bodies
{ 
	_body = _x;
	if(_body distance (position _vehicle) <= _lootDistance) then{
		_nearbyBodies append [_body];
	};
} forEach _allDead;

// Loot bodies
{
	_body = _x;

	_items = [
		uniform _body,
		vest _body,
		headgear _body,
		goggles _body
		// Not backpack, it has to be added separately
	];
	// Items inside uniform, vest, backpack
	_items append (itemsWithMagazines _body);
	// Map, compass, watch etc.
	// Includes binoculars / rangefinder WITHOUT batteries
	_items append (assignedItems _body);
	_items append (binocularMagazine _body); // Get batteries
	
	// Add items to vehicle
	{ _vehicle addItemCargoGlobal [_x, 1]; } forEach _items;

	// Weapons: primary, secondary (launcher), handgun
	// Add to vehicle with current attachments and ammo
	{
		_weapon = _x;
		_vehicle addWeaponWithAttachmentsCargoGlobal [_weapon, 1];
	} forEach weaponsItems _body;

	// Add backpack to vehicle
	// Some backpacks contain items by default when created.
	// The backpack has already been looted so remove these items later.
	_backpackClass = backpack _body;
	_hasBackpack = (count _backpackClass) > 0;
	if (_hasBackpack) then {
		_vehicle addBackpackCargoGlobal [_backpackClass, 1];			
	};
	
	// Remove all items from body
	// NOTE: this also removes items that were not looted, might need to be changed...
	_body setUnitLoadout (configFile >> "EmptyLoadout");
} forEach _nearbyBodies;

count _nearbyBodies; // Return