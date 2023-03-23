// Container can be equipment with inventory like backpack etc.
// or a "WeaponHolder" that contains weapons and items on the ground.
params ["_container", "_target"];

{ _target addWeaponWithAttachmentsCargoGlobal [_x, 1]} forEach weaponsItemsCargo _container;
{ _target addMagazineCargoGlobal [_x, 1] } forEach magazineCargo _container;
{ _target addItemCargoGlobal [_x, 1] } forEach itemCargo _container;
{ _target addBackpackCargoGlobal [_x, 1] } forEach backpackCargo _container;