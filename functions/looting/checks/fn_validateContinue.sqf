private _vehicle = _this; // Parameter

if(LoadToVehicle_Abort == true) exitWith{
	throw "ABORT";
};
if(_vehicle call LootToVehicle_fnc_isVehicleFull) then{
	LoadToVehicle_Abort = true; // Global variable
	throw "FULL";
};	