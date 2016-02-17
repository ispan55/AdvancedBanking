/*

 	Name: AdvBanking_Server_updateBank.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Updates Just the players bank

    _package = [_sessionid,[_playerUID,_bank]];
    ['updateBank',ExileClientSessionId,[(getPlayerUID player),(player getVariable "ExileBank")]] remoteExecCall ['AdvBanking_Server_HandleRequest', 2];

*/
private["_sessionid","_package","_playerUID","_bank","_exception"];

_sessionid = _this select 0;
_package = _this select 1;

_playerUID = _package select 0;
_bank= _package select 1;

try {
    ["Player Update Bank Request", "updateBank"] call AdvBanking_Server_DiagLog;

    if (_package isEqualTo []) then {
        throw "Package is empty!";
    };

    if (_playerUID isEqualTo 0) then {
        throw "Player UID not defined, cannot update!";
    };

    format["updateBank:%1:%2",_bank,_playerUID] call ExileServer_system_database_query_fireAndForget;

} catch {
    [_exception,"updateBank"] call AdvBanking_Server_DiagLog;
};
