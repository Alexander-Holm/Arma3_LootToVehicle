private _body = _this;
_hasLoot = (getUnitLoadout _body) isNotEqualTo (getUnitLoadout (configFile >> "EmptyLoadout"));
_hasLoot; // Return