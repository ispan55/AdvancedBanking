/*

 	Name: AdvBanking_Server_SetStats.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Sets all stats related to Advanced Banking for a specific Player

    _package = [_sessionid,[_playerUID,_wallet,_bank]]
    ['setStats',ExileClientSessionId,[(getPlayerUID player),(player getVariable "ExileClientPlayerMoney"),(player getVariable "ExileBank")]] remoteExecCall ['AdvBanking_Server_HandleRequest', 2];

*/
private["_sessionid","_package","_playerUID","_wallet","_bank"];

_sessionid = _this select 0;
_package = _this select 1;

_playerUID = _package select 0;
_wallet = _package select 1;
_bank= _package select 2;

try {
    ["Player Set Stats Request", "setStats"] call AdvBanking_Server_DiagLog;

    if (_package isEqualTo []) then {
        throw "Package is empty!";
    };

    if (_playerUID isEqualTo 0) then {
        throw "Player UID not defined, cannot update!";
    };

    format["setStats:%1:%2:%3",_wallet,_bank,_playerUID] call ExileServer_system_database_query_fireAndForget;

} catch {
    [_exception,"setStats"] call AdvBanking_Server_DiagLog;
};
