params["_unit", "_vehicle"];

_color = LootToVehicle_ScrollmenuColor call BIS_fnc_colorRGBtoHTML;
_title = _color call LootToVehicle_fnc_actionTitle;
_icon = _color call LootToVehicle_fnc_actionIcon;
_onScrollmenuClick = {
	_vehicle = _this select 3; // arguments passed down from addAction	
	_vehicle call LootToVehicle_fnc_lootStart;
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
_condition = "vectorMagnitude velocity _target < 0.1";

_actionId = _unit addAction [_title, _onScrollmenuClick, _arguments, _priority, _showWindow, _hideOnUse, _shortcut, _condition];
// Display an icon in the middle of the screen
_unit setUserActionText [_actionId, _title, _icon];
// Set actionId as a variable on the player so that the action can be removed later
_unit setVariable ["LootToVehicle_Action", _actionId];