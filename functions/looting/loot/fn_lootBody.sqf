params["_body", "_vehicle", "_sleepTime"];

// sleep first so that you cannot loot instantly by cancelling
sleep _sleepTime;


// Loot content inside uniform, vest, or backpack.
// These have to be looted and emptied first.
// weaponsItems will find weapons inside of them but can't remove them.
_vehicle call LootToVehicle_fnc_validateContinue; 
[uniformContainer _body, _vehicle] call LootToVehicle_fnc_lootContainer;
_vehicle addItemCargoGlobal [uniform _body, 1]; 
removeUniform _body;

_vehicle call LootToVehicle_fnc_validateContinue; 
[vestContainer _body, _vehicle] call LootToVehicle_fnc_lootContainer;
_vehicle addItemCargoGlobal [vest _body, 1]; 
removeVest _body;

_vehicle call LootToVehicle_fnc_validateContinue; 
_backpackClass = backpack _body;
_hasBackpack = (count _backpackClass) > 0; // Not empty string
if (_hasBackpack) then {
	// Loot backpack content
	[backpackContainer _body, _vehicle] call LootToVehicle_fnc_lootContainer;
	// Loot backpack
	[_vehicle, _backpackClass] call LootToVehicle_fnc_addBackpack;
	removeBackpack _body;
};	


// Loot weapons with current attachments and ammo.
// Primary and secondary (launcher) usually drop to the ground,
// will only get looted from body if body is in a vehicle.
// Binoculars IS a weapon and have to be looted before assignedItems is used.
_weapons = weaponsItems _body;
{
	_vehicle call LootToVehicle_fnc_validateContinue; 
	_vehicle addWeaponWithAttachmentsCargoGlobal [_x, 1]; 
	_weaponName = _x select 0;
	_body removeWeaponGlobal _weaponName;
} forEach _weapons;	


// assignedItems = [<Map>, <Compass>, <Watch>, <Radio>, <GPS>, <NVG>, <Binoculars>]
// Binoculars will not get removed here,
// they have to be looted and removed before this step.
_items = (assignedItems _body) + [headgear _body, goggles _body];
{
	_vehicle call LootToVehicle_fnc_validateContinue; 
	_vehicle addItemCargoGlobal [_x, 1];
	_body unassignItem _x;
	_body removeItem _x;
} forEach _items;