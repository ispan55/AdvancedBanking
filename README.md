# Advance Banking for Exile
###### Made by Shix and WolfkillArcadia
Advance Banking is a complete rewrite of Exile's default money system. It separates Exile Money into a wallet and a personal bank making money a more valuable object. This, in turn, creates a more realistic survival scenario.

---
### Features
- Brand new banking system
    - Two different ways of storing money
    - Personal Bank
    - Wallet
- Exile Wallet System
    - Players now carry a wallet
    - Players will drop their wallet on death (Pile of money)
    - Custom Prisoner ID cards when examining Wallets
        - Displays who it belongs to
        - How much money the wallet contains
- Brand new XM8
    - Three new buttons
        - Wallet
        - Personal Bank
        - Shared Bank [Not Yet Implemented]
- Custom ATM
    - Manage all of your accounts from one beautiful convenient screen
    - Deposit or withdrawal from personal bank
    - 21 ATMs placed randomly around the Altis not near any default traders.
        - Keeps players from camping them
        - Forces players to travel to ATMs with their precious money
- Minimal File Changes
    - Client side file changes
---
#### Server Owners:
Advanced Banking is coded to make the transition from default Exile money system to Advanced Banking. No database wipes are required, as that it moves the players current Exile Money to their personal bank accounts. Even works with "10,000 starter money"!
##### Variables
* Server
    * ExileMoney is removed
    * ExileClientPlayerMoney == Player Wallet
    * ExileBank == Player Personal Bank
    * PlayerHasPendingInv [Not Yet Implemented]
* Client
    * ExileClientPlayerMoney == Clientside Player Wallet
    * ExileClientBank == Clientside Player Personal Bank
---
### Roadmap
* Version 1: Initial release
* Version 2:
    * Shared Banking
        * Another bank account
        * Invite other players to this account
        * Great for parties!
    * Bug fixes
---
### Installation
There are two ways of installing Advanced Banking.

If you haven't changed any of the following files, follow these instructions: [Here](https://github.com/WolfkillArcadia/AdvancedBanking/blob/master/FreshServerInstallation.md)<br><br>
-- Server --
* ExileServer_object_player_createBambi.sqf
* ExileServer_object_player_database_load.sqf
* ExileServer_object_player_sendStatsUpdate.sqf
* ExileServer_system_territory_network_payTerritoryProtectionMoneyRequest.sqf
* ExileServer_system_territory_network_purchaseTerritory.sqf
* ExileServer_system_trading_network_purchaseItemRequest.sqf
* ExileServer_system_trading_network_purchaseVehicleRequest.sqf
* ExileServer_system_trading_network_purchaseVehicleSkinRequest.sqf
* ExileServer_system_trading_network_sellItemRequest.sqf
* ExileServer_system_trading_network_wasteDumpRequest.sqf

-- Client --
* ExileClient_object_player_event_onPlayerKilled.sqf
* ExileClient_gui_xm8_slide_apps_onOpen.sqf
* ExileClient_gui_xm8_slide_players_onOpen.sqf

If you **have** changed any of the above files, follow these instructions: [Here](https://github.com/WolfkillArcadia/AdvancedBanking/blob/master/ModdedServerInstallation.md)
