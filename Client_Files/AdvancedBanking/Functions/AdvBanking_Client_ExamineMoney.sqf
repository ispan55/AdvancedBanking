/*

 	Name: AdvBanking_Client_ExamineMoney.sqf

 	Author(s): Shix and WolfkillArcadia
    Copyright (c) 2016 Shix and WolfkillArcadia

 	Description:
    Handles when a player tries to examine money on the group
*/
private["_playerName","_worth"];

// @Shix: Is there a way to see if the credit card is already being display? So the player can't spam this.
_playerName = _this select 0;
_worth = _this select 1;
[_playerName,_worth] call AdvBanking_Client_CreditCardShow;
