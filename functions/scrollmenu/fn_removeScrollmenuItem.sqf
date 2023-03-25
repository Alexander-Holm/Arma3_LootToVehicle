_unit = _this; // Parameter

_actionId = _unit getVariable "LootToVehicle_Action";
_unit removeAction _actionId;
_unit setVariable ["LootToVehicle_Action", nil];