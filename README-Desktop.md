## Desktop wallet setup

Here are the steps for Windows Wallet:

1. Open the AceD Core Wallet.
2. Go to RECEIVE and create a New Address: **MN1**
3. Send **1000** **AceD** to **MN1**.
4. Wait for 15 confirmations.
5. Go to **Tools -> "Debug console - Console"**
6. Type the following command: **masternode genkey**
7. Type the following command: **masternode outputs**
8. Go to  ** Tools -> "Open Masternode Configuration File"
9. Add the following entry:
```
Alias Address Privkey TxHash Output_index
```
	* Alias: **MN1**
	* Address: **VPS_IP:PORT**
	* Privkey: **Masternode Private Key from Step 6**
	* TxHash: **First value from Step 7** 
	* Output index:  **Second value from Step 7** It can be **0** or **1**

10. Click OK and exit the Wallet.
11. Open AceD Core Wallet, go to **Masternode Tab**. If you tab is not shown, please enable it from: **Settings - Options - Wallet - Show Masternodes Tab**
12. Click **Update status** to see your node. If it is not shown, close the wallet and start it again.
13. Click **Start All** or **Start Alias**
14. If you are not able to see your **Masternode**, try to close and open your desktop wallet.
***