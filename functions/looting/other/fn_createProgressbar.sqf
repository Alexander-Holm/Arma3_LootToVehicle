// https://cbateam.github.io/CBA_A3/docs/files/ui/fnc_progressBar-sqf.html

params ["_bodiesCount", "_time"];

// Global variable - client side, not global for server
// Used to control exactly when the loot script should exit
LoadToVehicle_Abort = false; 

// str format gave weird extra quotation marks, using joinString instead
_textBodies = ["Looting", _bodiesCount] joinString " ";
if(_bodiesCount == 1) then {
	_textBodies = _textBodies + " body";
}
else {
	_textBodies = _textBodies + " bodies";
};

// Display time with one decimal
// Integers gets no decimal: 1, not 1.0
_textTime = _time toFixed 1; // One decimal
_lastDigit = _textTime select [(count _textTime) - 1, 1];
_isInteger = _lastDigit == "0";
if(_isInteger) then {
	_textTime = _time toFixed 0;
};
if(_textTime == "1") then {
	_textTime = _textTime + " second";
}
else {
	_textTime = _textTime + " seconds";
};

_title = str format [" %1     -     %2 ", _textBodies, _textTime];
_conditionToContinue = { LoadToVehicle_Abort == false; };
_onSuccess = {};
// If closed by user or condition fails
_onFailure = { 
	_failReason = _this select 4;
	_closedByUser = _failReason == 1;
	if(_closedByUser) then {
		["LootToVehicle_Aborted"] call BIS_fnc_showNotification;
	};
	// Loot script will exit at the next oppportunity 
	LoadToVehicle_Abort = true; 
};

_progressbarSettings = [
	_title, 
	_time, 
	_conditionToContinue,
	_onSuccess, 
	_onFailure
];

_progressbarSettings call CBA_fnc_progressBar;