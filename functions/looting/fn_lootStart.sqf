private _vehicle = _this; // Parameter

private _status = "LOOT_STATUS_NOT_UPDATED"; // Should always be overwritten
private _lootDistance = LootToVehicle_LootDistance; // CBA setting
try {
	private _position = position _vehicle;

	// Find loot
	private _bodies = [_position, _lootDistance] call LootToVehicle_fnc_findBodies;
	private _groundItemHolders = [_position, _lootDistance] call LootToVehicle_fnc_findGroundItems;
	if(count _bodies < 1 && count _groundItemHolders < 1) throw "NOTHING";

	count _bodies call LootToVehicle_fnc_calculateTime
		params ["_lootTimeTotal", "_lootTimeBody"]; // Returned values

	[count _bodies, _lootTimeTotal] call LootToVehicle_fnc_createProgressbar;

	// Loot items on the ground.
	// If items belong to a dead body then loot that body as well.
	{
		_invisibleContainer = _x;

		[_invisibleContainer, _vehicle] call LootToVehicle_fnc_lootContainer;

		// TODO: does this loot bodies outside range?
		_body = getCorpse _invisibleContainer;
		_itemsBelongToBody = isNull _body == false;
		if(_itemsBelongToBody) then {
			// The body could already be looted if it dropped more than one weapon,
			// primary and secondary (launcher) are usually placed in different invisible containers.
			// Don't loot the body if it has no loot to make sure sleep only happens once per body.
			_hasLoot = _body call LootToVehicle_fnc_bodyHasLoot;
			if(_hasLoot) then {
				[_body, _vehicle, _lootTimeBody] call LootToVehicle_fnc_lootBody;
			};
			// TODO: find other weapon
		};
	} forEach _groundItemHolders;

	// Loot bodies that did not drop anything to the ground.
	// Usually bodies inside vehicles or those that did not have a primary weapon nor launcher.
	{
		// Body could have been looted already.
		// Don't loot the body if it has no loot to make sure sleep only happens once per body.
		_body = _x;
		_hasLoot = _body call LootToVehicle_fnc_bodyHasLoot;
		if(_hasLoot) then {
			[_body, _vehicle, _lootTimeBody] call LootToVehicle_fnc_lootBody;
		}
	} forEach _bodies;

	_status = "DONE";
}
// Exceptions will be thrown to exit the looting early
catch{ _status = _exception; };

// Display notifications
switch (_status) do {
	case "DONE": { ["LootToVehicle_Success"] call BIS_fnc_showNotification };
	case "NOTHING": { ["LootToVehicle_NotFound", [round _lootDistance]] call BIS_fnc_showNotification };
	case "FULL": { ["LootToVehicle_Full"] call BIS_fnc_showNotification };
	case "ABORT": { ["LootToVehicle_Aborted"] call BIS_fnc_showNotification }; 
	case default { "Loot to vehicle - Error" hintC (str _status); };
};