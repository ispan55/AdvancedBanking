### Modded Server Install Instructions
This set of instructions is made for the people who have made changes to their ExileServer\_\* or ExileClient\_\* files and want Advanced Banking on their server.<br/>**THIS PART IS MORE ADVANCE. PLEASE READ CAREFULLY AND BACKUP YOUR FILES FIRST**<br/>
Advanced Banking is split up into three parts: SQL/extDB2, Server side, and Client side

#### SQL/extDB2
1. Open your favorite mySQL database editor
2. Copy and paste the contents of **AdvBanking.sql** into the query
3. Run the Query
4. Refresh your database and confirm two new tables
    * player_bank
    * player_bank_shared
5. You are done with the database changes.
6. Navigate to **@ExileServer/extDB/sql_custom_v2**
7. Open up the exile.ini in your favorite plain text editor
8. Copy and paste the contents of **AdvBanking_extDB2.ini** at the bottom of exile.ini
9. Save the file and this part is done!

#### Server Side
1. Copy the **AdvBanking_Server.pbo** into **@ExileServer/addons**
2. De-PBO your **exile_server.pbo**
3. We need to edit 10 server files. Locate and edit each one.
4. **ExileServer_object_player_createBambi.sqf**
    1. Add below after `_clanName = (_accountData select 5);`
    
                // Advanced Banking
                private["_advBank","_playerUID"];
                _playerUID = getPlayerUID _requestingPlayer;
                _advBank = format["getStats:%1",_playerUID] call ExileServer_system_database_query_selectSingle;
                _bambiPlayer setVariable ["ExileClientPlayerMoney", (_advBank select 1)];
                _bambiPlayer setVariable ["ExileBank",(_advBank select 2)];
                _bambiPlayer setVariable ["PlayerHasPendingInv",false];
                // Advanced Banking

    2. Comment out `_bambiPlayer setVariable ["ExileMoney", (_accountData select 0)];` after `_bambiPlayer setName _name;`
    3. Under `_parachuteNetID`, change `str (_accountData select 0)` to `str (_advBank select 1)`
5. **ExileServer_object_player_database_load.sqf**
    1. After `_player setName _name;`
        1. Comment out `_player setVariable ["ExileMoney", (_data select 38)];`
        2. Add underneath

                // Advanced Banking
                private["_advBank"];
                _advBank = format["getStats:%1",_playerUID] call ExileServer_system_database_query_selectSingle;
                _player setVariable ["ExileClientPlayerMoney", (_advBank select 1)];
                _player setVariable ["ExileBank",(_advBank select 2)];
                _player setVariable ["PlayerHasPendingInv",false];
                // Advanced Banking
        3. Under `(netId _player)` change `str (_player getVariable ["ExileMoney", 0]),` to `str (_player getVariable ["ExileClientPlayerMoney", 0]),`
6. **ExileServer_object_player_sendStatsUpdate.sqf**
    1. On line 16, change `str (_this getVariable ["ExileMoney", 0]),` to `str (_this getVariable ["ExileClientPlayerMoney", 0]),`
7. **ExileServer_system_network_event_onPlayerConnected.sqf**
    1. After `format["startAccountSession:%1:%2", _uid, _name] call ExileServer_system_database_query_fireAndForget;` on line 21
        1. Add

                // Advance Banking
        		_hasBankAccount = format["hasBankAccount:%1", _uid] call ExileServer_system_database_query_selectSingleField;
        		if (!_hasBankAccount) then {
        			format["createBankAccount:%1:%2",_uid,_name] call ExileServer_system_database_query_fireAndForget;
        			_ExileMoney = format["getAccountMoney:%1",_uid] call ExileServer_system_database_query_selectSingleField;
        			if (_ExileMoney > 0) then {
        				format["updateBank:%1:%2",_ExileMoney,_uid] call ExileServer_system_database_query_fireAndForget;
        				format["setAccountMoney:%1:%2",0,_uid] call ExileServer_system_database_query_fireAndForget;
        			};
        		};
        		// Advance Banking
    2. After `format["createAccount:%1:%2", _uid, _name] call ExileServer_system_database_query_fireAndForget;`
        1. Add

                // Advanced Banking
                format["createBankAccount:%1:%2",_uid,_name] call ExileServer_system_database_query_fireAndForget;
                // Advanced Banking
8. **ExileServer_system_territory_network_payTerritoryProtectionMoneyRequest.sqf**
    1. Change `_playerPopTabs = _playerObject getVariable ["ExileMoney", 0];` on line 37 to `_playerPopTabs = _playerObject getVariable ["ExileClientPlayerMoney", 0];`
    2. Replace the following

            _playerObject setVariable ["ExileMoney", _playerPopTabs];
            format["setAccountMoney:%1:%2", _playerPopTabs, getPlayerUID _playerObject] call ExileServer_system_database_query_fireAndForget;
        With

                // Advanced Banking
                _playerObject setVariable ["ExileClientPlayerMoney", _playerPopTabs];
                format["updateWallet:%1:%2", _playerPopTabs, getPlayerUID _playerObject] call ExileServer_system_database_query_fireAndForget;
                // Advanced Banking
9. **ExileServer_system_territory_network_purchaseTerritory.sqf**
    1. Change `_playerMoney = _player getVariable ["ExileMoney", 0];` on line 26 to `_playerMoney = _player getVariable ["ExileClientPlayerMoney", 0];`
    2. Replace

            format["setAccountMoney:%1:%2", _playerMoney, (getPlayerUID _player)] call ExileServer_system_database_query_fireAndForget;
            _player setVariable ["ExileMoney",_playerMoney];
        With

                // Advance Banking
                format["updateWallet:%1:%2", _playerMoney, (getPlayerUID _player)] call ExileServer_system_database_query_fireAndForget;
                _player setVariable ["ExileClientPlayerMoney",_playerMoney];
                // Advance Banking

10. **ExileServer_system_trading_network_purchaseItemRequest.sqf**
    1. Change `_playerMoney = _playerObject getVariable ["ExileMoney", 0];` on line 45 to `_playerMoney = _playerObject getVariable ["ExileClientPlayerMoney", 0];`
    2. Replace

            _playerObject setVariable ["ExileMoney", _playerMoney];
            format["setAccountMoney:%1:%2", _playerMoney, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
        With

                // Advanced Banking
                _playerObject setVariable ["ExileClientPlayerMoney", _playerMoney];
                format["updateWallet:%1:%2", _playerMoney, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
                // Advanced Banking
11. **ExileServer_system_trading_network_purchaseVehicleRequest.sqf**
    1. Change `_playerMoney = _playerObject getVariable ["ExileMoney", 0];` on line 42 `_playerMoney = _playerObject getVariable ["ExileClientPlayerMoney", 0];`
    2. Replace

            _playerObject setVariable ["ExileMoney", _playerMoney];
            format["setAccountMoney:%1:%2", _playerMoney, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
        With

                // Advance Banking
                _playerObject setVariable ["ExileClientPlayerMoney", _playerMoney];
                format["updateWallet:%1:%2", _playerMoney, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
                // Advance Banking
12. **ExileServer_system_trading_network_purchaseVehicleSkinRequest.sqf**
    1. Change `_playerMoney = _playerObject getVariable ["ExileMoney", 0];` on line 57 to `_playerMoney = _playerObject getVariable ["ExileClientPlayerMoney", 0];`
    2. Replace

            _playerObject setVariable ["ExileMoney", _playerMoney];
            format["setAccountMoney:%1:%2", _playerMoney, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
        With

                // Advanced Banking
                _playerObject setVariable ["ExileClientPlayerMoney", _playerMoney];
                format["updateWallet:%1:%2", _playerMoney, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
                // Advanced Banking
13. **ExileServer_system_trading_network_sellItemRequest.sqf**
    1. Change `_playerMoney = _playerObject getVariable ["ExileMoney", 0];` on line 82 to `_playerMoney = _playerObject getVariable ["ExileClientPlayerMoney", 0];`
    2. Change `_playerObject setVariable ["ExileMoney", _playerMoney];` on line 84 to `_playerObject setVariable ["ExileClientPlayerMoney", _playerMoney];`
    3. Replace `format["setAccountMoneyAndRespect:%1:%2:%3", _playerMoney, _playerRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;` on line 89
        with

                format["updateWallet:%1:%2", _playerMoney, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
                format["setAccountScore:%1:%2",_playerRespect,(getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;    

14. **ExileServer_system_trading_network_wasteDumpRequest.sqf**
    1. Change `_playerMoney = _playerObject getVariable ["ExileMoney", 0];` on line 54 to `_playerMoney = _playerObject getVariable ["ExileClientPlayerMoney", 0];`
    2. Change `_playerObject setVariable ["ExileMoney", _playerMoney];` on line 56 to `_playerObject setVariable ["ExileClientPlayerMoney", _playerMoney];`
    3. Change `format["setAccountMoneyAndRespect:%1:%2:%3", _playerMoney, _playerRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;` on line 61
        with

                format["setAccountScore",_playerRespect,(getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
                format["updateWallet",_playerMoney,(getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
15. You are all done!

#### Client Side
1. De-PBO your mission folder (Exile.Altis)
2. Copy AdvancedBanking and clientOverrides folders from AdvBanking/client into your mission folder
3. In your **init.sqf**
    1. Add to the top

            //Advance Banking by Shix and WolfkillArcadia
            [] execVM "AdvancedBanking\AdvBanking_Client_Init.sqf";

4. In your **description.ext**
    1. Add to the top

            //Advance Banking by Shix and WolfkillArcadia
            #include "AdvancedBanking\Dialog\AdvBanking_Client_Defines.hpp"
            #include "AdvancedBanking\Dialog\AdvBanking_Client_ATMDialog.hpp"
    2. Add at the bottom if you **don't** have RscTitles

            class RscTitles
            {
                //Advance Banking
                #include "AdvancedBanking\Dialog\AdvBanking_Client_CreditCard.hpp"
            };
    3. If you **do** have an RscTitles
        1. Add then inside the {}

                //Advance Banking
                #include "AdvancedBanking\Dialog\AdvBanking_Client_CreditCard.hpp"
    4. If you **don't** have infiSTAR
        1. Add the following to CfgRemoteExec

                class AdvBanking_Client_ClientHandleIncomingMessage { allowedTargets=1; };
                class AdvBanking_Server_HandleRequest { allowedTargets=2; };
           So it looks like this:

                class CfgRemoteExec
                {
                    class Functions
                    {
                        mode = 1;
                        jip = 0;
                        class ExileServer_system_network_dispatchIncomingMessage     { allowedTargets=2; };
                        class AdvBanking_Client_ClientHandleIncomingMessage { allowedTargets=1; };
		                class AdvBanking_Server_HandleRequest { allowedTargets=2; };
                    };
                    class Commands
                    {
                        mode=0;
                        jip=0;
                    };
                };
5. If you **do** have infiSTAR
    1. Open up CfgRemoteExec.hpp that came with your copy of infiSTAR
        11. Add the following to CfgRemoteExec

                class AdvBanking_Client_ClientHandleIncomingMessage { allowedTargets=1; };
                class AdvBanking_Server_HandleRequest { allowedTargets=2; };
           So it looks like this:

                class CfgRemoteExec
                {
                    class Functions
                    {
                        mode = 1;
                        jip = 0;
                        //	remoteExecCall not used for a while
	                    //	class fnc_AdminReq { allowedTargets=2; };
                        class ExileServer_system_network_dispatchIncomingMessage     { allowedTargets=2; };
                        class AdvBanking_Client_ClientHandleIncomingMessage { allowedTargets=1; };
		                class AdvBanking_Server_HandleRequest { allowedTargets=2; };
                    };
                    class Commands
                    {
                        mode=0;
                        jip=0;
                    };
                };
6. Open up **config.cpp**
    1. Locate `class CfgInteractionMenus`
    2. Add the following within the {} for `class CfgInteractionMenus`

            // Advance Money
            class MoneyPile
            {
                targetType = 2;
                target = "Land_Money_F";

                class Actions
                {
                    class Examine: ExileAbstractAction
        			{
        				title = "Examine Wallet";
        				condition = "((ExileClientInteractionObject getVariable ['DroppedAmount',0]) > 0)";
        				action = "[(ExileClientInteractionObject getVariable ['PileOwner',0]),(ExileClientInteractionObject getVariable ['DroppedAmount',0])] call AdvBanking_Client_ExamineMoney";
        			};
                    class Collect: ExileAbstractAction
        			{
        				title = "Collect Dropped Wallet";
        				condition = "((ExileClientInteractionObject getVariable ['DroppedAmount',0]) > 0)";
        				action = "[(ExileClientInteractionObject getVariable ['DroppedAmount',0])] call AdvBanking_Client_CollectMoney";
        			};
                };
            };
        	class ATM
            {
                targetType = 2;
                target = "Land_Atm_01_F";

                class Actions
                {
                    class Access: ExileAbstractAction
        			{
        				title = "Access ATM";
        				condition = "true";
        				action = "createDialog 'AdvBankingATM';";
        			};
                };
            };
            // Advance Money
    3. Locate `class CfgExileCustomCode`
    4. Add the following inside the {} for `class CfgExileCustomCode`

               ExileClient_object_player_event_onPlayerKilled = "ClientOverrides\ExileClient_object_player_event_onPlayerKilled.sqf";
               ExileClient_gui_xm8_slide_apps_onOpen = "ClientOverrides\ExileClient_gui_xm8_slide_apps_onOpen.sqf";
               ExileClinet_gui_xm8_slide_players_onOpen = "ClientOverrides\ExileClient_gui_xm8_slide_players_onOpen.sqf";
       So it looks like this:

               class CfgExileCustomCode {
                   ExileClient_object_player_event_onPlayerKilled = "ClientOverrides\ExileClient_object_player_event_onPlayerKilled.sqf";
                   ExileClient_gui_xm8_slide_apps_onOpen = "ClientOverrides\ExileClient_gui_xm8_slide_apps_onOpen.sqf";
                   ExileClinet_gui_xm8_slide_players_onOpen = "ClientOverrides\ExileClient_gui_xm8_slide_players_onOpen.sqf";
               };
7. Woohoo! Client side is done and that's it!
