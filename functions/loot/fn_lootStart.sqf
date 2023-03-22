params ["_vehicle", "_lootDistance"];

// Keep track of how many backpacks are already in the vehicle,
// so that their inventory is not deleted.
_previousBackpacksCount = count backpackCargo _vehicle;

// Loot
_countBodies = [_vehicle, _lootDistance] call LootToVehicle_fnc_lootBodies;
_countGround = [_vehicle, _lootDistance] call LootToVehicle_fnc_lootGround;

// All items are looted,
// but only number of bodies and items directly on the ground are counted.
_foundLoot = ( (_countBodies + _countGround) > 0 );
if(_foundLoot) then {
	// Some backpacks contain items by default when created, remove those items.
	[_previousBackpacksCount, _vehicle] call LootToVehicle_fnc_emptyAddedBackpacks;

	hint parseText format ["
		<t align='left' size='1.25'>Loot transferred to this vehicle</t> <br/>
		<t align='left'>%1 bodies looted</t> <br/>
		<t align='left'>%2 items looted from the ground</t>
	", _countBodies, _countGround]; 
	sleep 8;
	hintSilent ""; sleep 0.5;
}
else{
	hint parseText "<t size='1.15'>No loot found</t>"; 
	sleep 8;
	hintSilent ""; sleep 0.5;
};