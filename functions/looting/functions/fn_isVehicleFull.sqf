_vehicle = _this;

if(LootToVehicle_IgnoreCargoLoad == true) exitWith{ false; };
load _vehicle >= LootToVehicle_CargoLoadMultiplier; // Else return this