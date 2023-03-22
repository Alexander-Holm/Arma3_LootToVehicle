params["_unit", "_vehicle"];

_color = "#d6ffe0";
_title = format["<t color='%1'>Loot to vehicle</t>", _color];
_icon = format["<img color='%1' size='2' image='a3\ui_f\data\igui\cfg\actions\loadvehicle_ca.paa' />", _color];
_onScrollmenuClick = {
	_vehicle = _this select 3; // arguments passed down from addAction

	_lootDistance = 100;
	// Keep track of how many backpacks are already in the vehicle,
	// so that their inventory is not deleted.
	_previousBackpacksCount = count backpackCargo _vehicle;

	// Loot
	_countBodies = [_vehicle, _lootDistance] call LootToVehicle_fnc_lootBodies;
	_countGround = [_vehicle, _lootDistance] call LootToVehicle_fnc_lootGround;

	// All items are looted,
	// but only number of bodies and items directly on the ground are counted.
	_foundLoot = (_countBodies + _countGround) > 0;
	if(_foundLoot) then {
		// Some backpacks contain items by default when created, remove those items.
		[_previousBackpacksCount, _vehicle] call LootToVehicle_fnc_emptyAddedBackpacks;

		hint parseText format ["
			<t size='1.25'>Loot transferred to vehicle</t> <br/>
			<t>%1 bodies looted</t> <br/>
			<t>%2 items looted from the ground</t>
		", _countBodies, _countGround]; 
		sleep 8;
		hintSilent ""; sleep 0.5;
	}
	else{
		hint "No loot found"; sleep 8;
		hintSilent ""; sleep 0.5;
	};
};
_arguments = _vehicle;
_priority = 0;
// Prevents title from showing before you scroll to the menu item,
// otherwise title might show immediately upon entering a vehicle.
_showWindow = false; 
// Close scrollmenu on click
_hideOnUse = true; 
// Shortcut key not needded
_shortcut = ""; 
// Show scrollmenu item if vehicle is stationary.
// Condition is evaluated every frame.
// addAction wants the condition as a string.
// _target is the player and is passed to the condition by addAction.
_showCondition = "vectorMagnitude velocity _target < 1";

_actionId = _unit addAction [_title, _onScrollmenuClick, _arguments, _priority, _showWindow, _hideOnUse, _shortcut, _showCondition];
// Text shown in the middle of the screen
_unit setUserActionText [_actionId, _title, _icon];
// Set actionId as a variable on the player so that the action can be removed later
_unit setVariable ["LootToVehicle_Action", _actionId];