### Fresh Server Install Instructions
This set of instructions is assuming that the Exile server/client files have not be modded in any way. IE, you haven't changed any ExileServer\_\* or ExileClient\_\* files.<br/>
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
3. Copy and replace the files in exile_server/code with the ones from AdvBanking/server/exile_server/code
4. Re-PBO your **exile_server** folder
5. Server side installation is done!

#### Client Side
1. De-PBO your mission folder (Exile.Altis)
2. Copy AdvancedBanking and clientOverrides folders from AdvBanking/client into your mission folder
3. In your init.sqf
    1. Add to the top

            //Advance Banking by Shix and WolfkillArcadia
            [] execVM "AdvancedBanking\AdvBanking_Client_Init.sqf";

4. In your description.ext
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
6. Open up config.cpp
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
