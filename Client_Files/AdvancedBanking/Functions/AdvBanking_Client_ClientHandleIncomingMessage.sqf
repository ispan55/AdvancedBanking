/*

 	Name: AdvBanking_Client_ClientHandleIncomingMessage.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Handles all incoming requests ralated to Advanced Banking from the server

*/
private["_payLoad","_requestType","_messageContent"];
_payLoad = _this;
_requestType = _payLoad select 0;
_messageContent = _payLoad select 1;

//[format["Payload: %1",_payLoad],"ClientHandleIncomingMessage"] call AdvBanking_Client_DiagLog;
switch (_requestType) do {
    case ("getStats"): {
        BankPlayerName = _messageContent select 0;
        ExileClientPlayerMoney  = _messageContent select 1;
        ExileClientBank  = _messageContent select 2;
    };
};
