if(player call LootToVehicle_fnc_hasAction) then {
	_color = LootToVehicle_ScrollmenuColor call BIS_fnc_colorRGBtoHTML;
	_title = _color call LootToVehicle_fnc_actionTitle;
	_icon = _color call LootToVehicle_fnc_actionIcon;

	player setUserActionText [_actionId, _title, _icon];
};
