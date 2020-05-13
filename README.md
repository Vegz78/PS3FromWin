# PS3FromWin
Script package to automate waking and playing your PS3 from your (remote) Windows PC.

Consists of one main and easily modifiable caller script, PS3FromWin.bat, and 3 dedicated scripts which can be run independently:
  - WinWakePS3.bat - Remotely power on a PS3 from a Windows PC via a networked Linux device's Bluetooth radio
  - GIMXAdapter.bat - Find and set up GIMX on the correct COM-ports of up to two GIMX adapters connected to the PC
  - CapturePS3.bat -  Run a HDMI capture card application, so that you can play your PS3 (remotely) on your PC

*Any tips about better working solutions for automatically and remotely powering on the PS3 over Bluetooth directly from Windows, would be greatly appreciated! Please post it as an issue inside this repository.*

Feel free to copy, modify and use as you want. The script does what it's supposed to on my home system and won't be actively supported, updated or maintained.

# Prerequisites
- PC running Windows
- Linux device with [compatible](https://gimx.fr/wiki/index.php?title=Bluetooth_dongle)(Most Raspberry Pis) Bluetooth and [WakePS3](https://github.com/Vegz78/WakePS3) installed
- [Putty](https://www.putty.org) with [plink](https://the.earth.li/~sgtatham/putty/0.73/htmldoc/Chapter7.html#plink)
- [Gimx](https://github.com/matlo/GIMX/releases/) for Windows
- The [X360Pad.xml](https://github.com/matlo/GIMX-configurations/blob/master/Windows/X360Pad.xml) config file in %HOMEPATH%\AppData\Roaming\gimx\config
<br>(Or any other xml config file to your liking)
- HDMI capture card and software

# Features
- Automatically and remotely power on your PS3 remotely over Bluetooth from a Windows PC(via via a networked Linux device's Bluetooth radio)
- Automatically set up GIMX adapters connected between your Windows PC and PS3 etc.
- Automatically start your HDMI capture software to play your PS3 etc. on your Windows PC
- All the above automatically with PS3FromWin.bat, or 3 other bat scripts independently
- Some basic error handling

# Usage

1 - Download and copy the bat scripts into a folder inside your %PATH% variable and/or make shortcuts on your Windows PC <br>
    Alternatively, in your desired folder, run:<BR>
    ```git clone https://github.com/Vegz78/WakePS3```

2 - Install and set up WakePS3 on an always-on and compatible Bluetooth enabled Linux device, as explained here: https://github.com/Vegz78/WakePS3

3 - Edit the global variables inside the 4 above mentioned bat scripts to fit your setup

4 - Run PS3FromWin.bat to run all scripts consecutively, or any of the 3 other bat scripts independently
