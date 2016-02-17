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
    - 3 Client side file changes
    - 10 Server side file changes
---
#### Server Owners:
Advanced Banking is coded to make the transition from default Exile money system to Advanced Banking. No database wipes are required, as that it moves the players current Exile Money to their personal bank accounts. Even works with "10,000 starter money"!

#### Changing ATMs
Currently the ATMs are placed for Altis, and are controlled via AdvBanking_Server\code\AdvBanking_Server_PlaceATM.sqf. This output is from M3Editor and can easily be adapted to any map. If you would like to share your ATM placement, please pass the files to us and we will update the github.

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
There are two ways of installing Advanced Banking.<br>
**BEFORE INSTALLING: BACK UP ALL MISSION FILES, SERVER FILES, AND DATABASE**

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

### Disclaimer
Everything offered in this repository is offered with NO WARRANTY. We am not responsible for any damages these files may cause either that being physical, emotional, or anything in between. We am not responsible if these files run off with your wife or husband or happens to kill your dog. We do offer support for any bugs, features, or setup that we have added to this server/mission files. If you have any issues or have any questions, please comment on the Exile Forums post or open an issue on Github

### Copyright
Copyright (c) 2016 Shix and Wolfkillarcadia

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>

Contact: mrshix1996@gmail.com or wolfkillarcadia@gmail.com
