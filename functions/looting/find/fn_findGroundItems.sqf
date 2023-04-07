params ["_position", "_distance"];

_invisibleContainers = []; 
// Loot from bodies, usually primary weapon and launcher
_invisibleContainers append (_position nearObjects ["WeaponHolderSimulated", _distance]);
// Loot dropped on the ground.
// Despite the name, WeaponHolder contains all kinds of items, not just weapons.
_invisibleContainers append (_position nearObjects ["WeaponHolder", _distance]);

_invisibleContainers; // Return;