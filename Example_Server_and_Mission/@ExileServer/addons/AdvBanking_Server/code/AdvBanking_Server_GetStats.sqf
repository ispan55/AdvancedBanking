/*

 	Name: AdvBanking_Server_GetStats.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    gets all stats related to Advanced Banking for a specific player

*/
private["_payLoad","_sessionId","_playerObject","_playerUid","_playerStats","_name","_playerWallet","_playerBank"];

["Player Get Stats Request", "getStats"] call AdvBanking_Server_DiagLog;
_payLoad = _this;
_sessionId = _payLoad select 0;
_playerObject = _sessionId call ExileServer_system_session_getPlayerObject;
_playerUid = getPlayerUID _playerObject;

_playerStats = format ["getStats:%1", _playerUid] call ExileServer_system_database_query_selectSingle;

_name = _playerStats select 0;
_playerWallet = _playerStats select 1;
_playerBank = _playerStats select 2;

['getStats',[_name,_playerWallet,_playerBank],_sessionId] call AdvBanking_Server_SendToClient;
