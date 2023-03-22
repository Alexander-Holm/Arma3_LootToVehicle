params["_previousBackpacksCount", "_vehicle"];

_backpacks = everyBackpack _vehicle;
_newBackpacks = _backpacks select [_previousBackpacksCount, count _backpacks];
{
	_backpack = _x;
	clearItemCargoGlobal _backpack;
	clearWeaponCargoGlobal _backpack;
	clearMagazineCargoGlobal _backpack;
} forEach _newBackpacks;