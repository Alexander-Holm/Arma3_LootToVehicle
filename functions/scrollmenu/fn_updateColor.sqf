_actionId = player getVariable "LootToVehicle_Action";
_hasAction = isNil "_actionId" == false;
if(_hasAction) then {
	_color = LootToVehicle_ScrollmenuColor call BIS_fnc_colorRGBtoHTML;
	_title = _color call LootToVehicle_fnc_actionTitle;
	_icon = _color call LootToVehicle_fnc_actionIcon;

	player setUserActionText [_actionId, _title, _icon];
};
