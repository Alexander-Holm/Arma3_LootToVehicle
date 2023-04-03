params ["_vehicle", "_backpackClass"];

_vehicle addBackpackCargoGlobal [_backpackClass, 1];
// Some backpacks contain items by default when created, remove those items.
_vehicleBackpacks = everyBackpack _vehicle;
_lastBackpack = _vehicleBackpacks select (count _vehicleBackpacks - 1);
_lastBackpack call LootToVehicle_fnc_clearContainer;