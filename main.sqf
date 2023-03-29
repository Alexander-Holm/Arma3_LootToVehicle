player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];

	if(_role == "driver") then {
		[_unit, _vehicle] call LootToVehicle_fnc_createAction;
	};	
}];

player addEventHandler ["SeatSwitchedMan", {
	params ["_unit", "_otherUnit", "_vehicle"];
	_role = assignedVehicleRole _unit select 0;

	_hasAction = _unit call LootToVehicle_fnc_hasAction;
	// Checks if the unit already has the action.
	// Prevents giving more than one action if any vehicle
	// will ever have multiple drivers.
	if(_role == "driver" && _hasAction == false) then {
		[_unit, _vehicle] call LootToVehicle_fnc_createAction;
	}
	else { if(_hasAction) then {
		_unit call LootToVehicle_fnc_removeAction;
	}};
}];

player addEventHandler ["GetOutMan", {
	params ["_unit"];
	_hasAction = _unit call LootToVehicle_fnc_hasAction;
	if(_hasAction) then {
		_unit call LootToVehicle_fnc_removeAction;
	};
}];	

player addEventHandler ["Respawn", {
	params ["_unit"];
	// Action is removed on death but not the variable.
	// Remove variable to make seat switching work correctly.
	_unit setVariable ["LootToVehicle_Action", nil];
}];