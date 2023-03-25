_actionId = player getVariable "LootToVehicle_Action";
if(isNil "_actionId") exitWith { nil; }; // There is nothing to update

_color = LootToVehicle_ScrollmenuColor call BIS_fnc_colorRGBtoHTML;
_title = _color call LootToVehicle_fnc_scrollmenuTitle;
_icon = _color call LootToVehicle_fnc_scrollmenuIcon;

player setUserActionText [_actionId, _title, _icon];