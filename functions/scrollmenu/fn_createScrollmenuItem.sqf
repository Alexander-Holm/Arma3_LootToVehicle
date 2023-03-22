params["_unit", "_script", "_scriptArguments"];

_title = "<t color='#d6ffe0'>Loot to vehicle</t>";
// _onClick cannot access the params above,
// they have to be passed to the function.
// It looks a bit weird but is required to be able to add any
// function with any arguments to the addAction by calling this file.
_onClick = {
	_params = _this select 3; // from addAction
	_params params ["_script", "_arguments"];
	_arguments call _script;
};
_priority = 0;
// Prevents title from showing before you scroll to the menu item,
// otherwise title might show immediately upon entering a vehicle.
_showWindow = false; 

_actionId = _unit addAction [_title, _onClick, [_script, _scriptArguments], _priority, _showWindow];
// Set actionId as a variable on the player so that the action can be removed later
_unit setVariable ["LootToVehicle_Action", _actionId];