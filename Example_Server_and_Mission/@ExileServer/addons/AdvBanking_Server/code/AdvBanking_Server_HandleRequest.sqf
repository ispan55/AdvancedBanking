/*

 	Name: AdvBanking_Server_HandleRequest.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Handles all incoming requests from clients

*/

private["_payLoad","_action","_sessionId","_package"];

_payLoad = _this;

_action = _payLoad select 0;
_sessionId = _payLoad select 1;
_package = _payLoad select 2;

switch (_action) do {
    case ("createBankAccount"): {
        //Creates bank account for player (will only be used the first time the player connects to the server)
        [_sessionId,_package] call AdvBanking_Server_CreateBankAccount;
    };
    case ("getStats"): {
        //Gets all the advanced banking related stats
        [_sessionId,_package] call AdvBanking_Server_GetStats;
    };
    case ("setStats"): {
        //Sets all the advanced banking related stats
        [_sessionId,_package] call AdvBanking_Server_SetStats;
    };
    case ("JoinSharedBank"): {
        //Adds player to shared bank account
        [_sessionId,_package] call AdvBanking_Server_JoinSharedBank;
    };
    case ("kickFromSharedBank"): {
        //Kicks a given player form the shared bank account (sender must be owner)
        [_sessionId,_package] call AdvBanking_Server_KickFromSharedBank;
    };
    case ("updateBank"): {
        //Updates the players bank acount on the database
        [_sessionId,_package] call AdvBanking_Server_updateBank;
    };
    case ("updateWallet"): {
        //Updates the players Wallet acount on the database
        [_sessionId,_package] call AdvBanking_Server_updateWallet;
    };
};
