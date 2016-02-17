/*

 	Name: AdvBanking_Client_CarpetMuncher.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    I may have wrote this late at night. Handles formating and remoteexec. Because reasons.
*/
private ["_request","_sessionID","_packet","_exception"];
_request = _this select 0;
_sessionID = _this select 1;
_packet = _this select 2;

try {
    if (_request isEqualTo "") then {
        throw "Request undefined, please insert 20 units of your currency";
    };
    if (_sessionID isEqualTo "") then {
        throw "Who are you again?";
    };
    if (_packet isEqualTo []) then {
        throw "Sir, no matter what request you give me, I cannot munch without a packet";
    };
    //[format["Sending Request: %1",_request],"PacketMuncher"] call AdvBanking_Client_DiagLog;
    [_request,_sessionID,_packet] remoteExecCall ['AdvBanking_Server_HandleRequest', 2];
} catch {
    [_exception,"PacketMuncher"] call AdvBanking_Client_DiagLog;
};






































hint format["%1"];
