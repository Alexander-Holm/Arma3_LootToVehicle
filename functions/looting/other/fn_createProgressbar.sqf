params ["_bodiesCount", "_time"];

// Global variable - client side, not global for server
// Used to control exactly when the loot script should exit
LoadToVehicle_Abort = false; 

_pluralSingular = "";
if(_bodiesCount > 1) then {
	_pluralSingular = "bodies";
}
else {
	_pluralSingular = "body";
};

_timeFormatted = _time toFixed 1;
// Display integers as 1, not 1.0
// Is clearer at a glance, the text is already hard to read
_lastDigit = _timeFormatted select [(count _timeFormatted) - 1, 1];
_isInteger = _lastDigit == "0";
if(_isInteger) then {
	_timeFormatted = _time toFixed 0;
};

_title = str format [" %1 seconds  -  Looting %2 %3 ", _timeFormatted, _bodiesCount, _pluralSingular];
_conditionToContinue = { LoadToVehicle_Abort == false; };
_onSuccess = {};
// If closed by user or condition fails
_onFailure = { LoadToVehicle_Abort = true; };

_progressbarSettings = [
	_title, 
	_time, 
	_conditionToContinue,
	_onSuccess, 
	_onFailure
];

_progressbarSettings call CBA_fnc_progressBar;