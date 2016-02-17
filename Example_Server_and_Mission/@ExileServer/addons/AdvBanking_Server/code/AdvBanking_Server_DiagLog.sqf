/*

 	Name: AdvBanking_Server_DiagLog.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Handles writing messages to the server logs

*/
private ["_msg"];
_msg = format["ADVANCE BANKING: [%1] : %2",(_this select 1),(_this select 0)];
diag_log _msg;
