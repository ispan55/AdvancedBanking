/*

 	Name: AdvBanking_SendToClient.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Sends information relating to Advanced Banking back to the client

*/
private["_payLoad","_type","_messageContent","_recipient","_player"];
_payLoad = _this;
_type = _payLoad select 0;
_messageContent = _payLoad select 1;
_recipient = _payLoad select 2;
_player = _recipient call ExileServer_system_session_getPlayerObject;



switch (_type) do {
    case ("getStats"): {
        if(typeName _player isEqualTo "SCALAR")then
        {
        	['getStats',_messageContent] remoteExecCall ["AdvBanking_Client_ClientHandleIncomingMessage", _player];
        }
        else
        {
        	['getStats',_messageContent] remoteExecCall ["AdvBanking_Client_ClientHandleIncomingMessage", owner _player];
        };
    };
};
