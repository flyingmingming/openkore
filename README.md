4 versions here with each branch as a different version, ideally only the master branch is what you want, the other 3 are experimental and you can ignore them.

##	1. Master Branch:

	-	Forked from the official OpenKore repository.
	-	Modified files and tables to work with the Payon Tales server, this is the same if not identical to what is uploaded on the main website(https://payontales.com/).
	-	Extracted filesize - 276 MB

# Experimental Branches
##	2. Pruned-Minimal Branch:

	-	Deleted unused tables, resulting in an 80MB reduction in file size.
	-	Adjusted timeouts and default configurations for better CPU usage.
	-	Sys.txt to load specific plugins only.
	-	Extracted filesize - 199 MB
	
##	3. Pruned-More Branch:

	-	Inherits changes from the Pruned-Minimal branch.
	-	Deleted unused plugins, compilers, and Perl components, saves around 10-25% ram usage compared to the original.
	-	Removed additional files from the tables folder to save RAM and file size(Korean text files, Description files).
	-	Deleted alternative start options (e.g., WStart, VXStart) to save a few more on the filesize.
	-	Extracted filesize - 125 MB

##	4.	Pruned-Extreme Branch:

	-	Includes all changes from the Pruned-More branch.
	-	Increased sleeptime and timeout values.
	-	Customized timers for specific plugins like eventsMaccro to reduce checking frequency.
	-	Extracted filesize - 125 MB
	
	Note: This branch may affect responsiveness and is not advisable if using combat-related macros.


###	I also made some amateur observation and experementations and would share it below:<br>

<br>
For the ram usage:

![ramusage](https://github.com/KoukatsuMahoutsukai/openkore-payontales/assets/123940777/3c944381-ad50-42b8-90f8-77ec800ce3a7)


The process just started and right off the bat you can see big differences in ram usage, this is due to tables and plugins removed from the "More" and "Extreme" version.
although from my observations after a few hours or so ram usage would drop for all of them and the difference in ram usage would be smaller maybe 10mb less ram usage for the "More" and "Extreme".<br>
<br><br>


###	For cpu usage:

![cpu usage](https://github.com/KoukatsuMahoutsukai/openkore-payontales/assets/123940777/5cc3acfe-191d-4597-87e4-4ef6928fa566)


The average value is the one to look for here with it being how many % it uses of the cpu, most of the difference in the cpu usage most likely came from the sleepTime differences.

Master	=	2.195% (10000 sleepTime)

Minimal	=	1.392% (50000 sleepTime)

More	=	0.759% (200000 sleepTime)

Extreme	=	0.636% (250000 sleepTime)<br>
<br><br>

###	For the exp/hr:

![expperhr](https://github.com/KoukatsuMahoutsukai/openkore-payontales/assets/123940777/76358cdb-05ab-4221-ad09-583f90e0155b)


I cant think of a metric to show the differences in the responsiveness of the bots other than observing it ingame, im showing the exp/hr for each to show that despite the minimal,more and extreme having 
higher sleepTime or timeouts.

IF the purpose for the bot is only farming then it wouldnt matter that much. say running two or three "More" version of the bots would probably be better than running one "Master" but
then again if you are farming on a map with alot of aggressives or high level map then it might be better to have the lower sleepTime. I would try to gather more data on these and post it later on<br>
<br><br>


![logo](https://upload.wikimedia.org/wikipedia/commons/b/b5/Kore_2g_logo.png)

![Language](https://img.shields.io/badge/language-Perl-blue.svg)

![Stars](https://img.shields.io/github/stars/OpenKore/openkore)
![Fork](https://img.shields.io/github/forks/OpenKore/openkore?label=Fork)
![Watch](https://img.shields.io/github/watchers/OpenKore/openkore?label=Watch)

![Issues](https://img.shields.io/github/issues/OpenKore/openkore)
![Pull Requests](https://img.shields.io/github/issues-pr/OpenKore/openkore.svg)
![Contributors](https://img.shields.io/github/contributors/OpenKore/openkore.svg)

![Github_Workflow_status](https://img.shields.io/github/workflow/status/OpenKore/openkore/CI)
![Github_Workflow_CI](https://github.com/OpenKore/openkore/workflows/CI/badge.svg)

* OpenKore is a custom client and intelligent automated assistant for Ragnarok Online.
* It is a **free**, open source and cross-platform program _(Linux, Windows and MacOS are supported)_.

## Prerequisites

To run OpenKore you will need:
* [Read the Requirements page on our wiki](https://openkore.com/wiki/How_to_run_OpenKore#Requirements)

## Quickstart

1. [Download OpenKore](https://github.com/OpenKore/openkore/archive/master.zip) and extract it. Alternatively, you could press the **Windows Key + R**, type in ``cmd`` & enter. Run the following command in the cmd to clone.
***Note: [Git](https://git-scm.com/) required.***
```
git clone https://github.com/OpenKore/openkore.git
```

2. Configure OpenKore: [documentation](https://openkore.com/wiki/Category:Control).
3. Run openkore.pl _(You can run start.exe or wxstart.exe if you use Windows)_.

## F.A.Q. (Frequently Asked Questions)
<!-- Source: https://forums.openkore.com/viewtopic.php?f=0&t=11287 -->
 1. **Have a problem?**
    - Update your openkore or download a new one.
 2. **Still having problems?**
    - Search in [Wiki](https://openkore.com/wiki/).
    - Search in [Forum](https://forums.openkore.com/).
    - Search in [Github issues](https://github.com/openkore/openkore/issues?utf8=%E2%9C%93&q=).
 3. **Cant find what you need? / Do not understand?**
    - Ask in [IRC Channel](https://webchat.freenode.net/#openkore).
 4. **Is it a problem in Openkore?**
    - Read [things to know](https://github.com/OpenKore/openkore#things-to-know) before [reporting](https://github.com/OpenKore/openkore/issues/new).

## Things to know

* Make sure you've read [FAQ](https://github.com/OpenKore/openkore#faq-frequently-asked-questions) especially to [run latest commit on master branch](https://github.com/OpenKore/openkore/commits/master) & checking [existed issue for your request.](https://github.com/OpenKore/openkore/issues?utf8=%E2%9C%93&q=)
* Please post in English.
* Please use the issue template.
* Please include informations about your server & any changes you did in your configuration.
* Briefly explain what happened, take a screenhot & include the error message _(If available)_.
* Please be advised any developers here are doing this on their free time. Please give some time for anyone to respond.

## Status of botting on Official Servers

| Server | Description | Protection | Status | Supporter |
| --- | --- | --- | --- | --- |
| [aRO](https://www.gnjoy.asia/) | Asia RO | CheatDefender | Not working | N/A |
| [bRO](http://ragnarok.uol.com.br/) | Brazil RO | EAC | Not working | N/A |
| [cRO](http://ro.qiquanwl.com) | China RO | nProtect | Botable | N/A |
| [euRO](https://eu.4game.com/ro/) | Europe RO | Frost Security | Not working | N/A |
| [euRO-Prime](https://eu.4game.com/roprime/) | Europe RO (Prime) | Frost Security | Not working | N/A |
| [iRO Renewal](http://renewal.playragnarok.com/) | International RO | EAC | Not working | N/A |
| [idRO](https://ro.gnjoy.id/) | Indonesia RO | EAC | Not Working | N/A |
| [idRO-Retro](https://roretro.gnjoy.id/) | Indonesia RO (Retro) | Delphine | Not Working | N/A |
| [jRO](https://ragnarokonline.gungho.jp/) | Japan RO | nProtect | Need Verification | N/A |
| [kRO](http://ro.gnjoy.com/) | Korea RO | nProtect | Botable | N/A |
| [kRO-Zero](http://roz.gnjoy.com/) | Korea RO (Zero) | nProtect | Botable | N/A |
| [ruRO-Prime](https://ru.4game.com/roprime/) | Russia RO (Prime) | Frost Security | Not Working | ya4ept |
| [tRO](https://ro.gnjoy.in.th/) | Thailand RO | EAC | Not Working | N/A |
| [tRO-Classic](https://roc.gnjoy.in.th/) | Thailand RO (Classic) | EAC  | Not Working | N/A |
| [twRO](https://ro.gnjoy.com.tw/) | Taiwan RO | CheatDefender | Not Working | N/A |
| [vRO](https://ro.vtcgame.vn/) | Vietnam RO | nProtect | Not Working | N/A |

## Contributing

OpenKore is developed by a [team](https://github.com/OpenKore/openkore/graphs/contributors) located around the world. Check out the [documentation](https://openkore.com/wiki/Manual) and if necessary, submit a pull request.

## Contacts

* [OpenKore Wiki](https://openkore.com/wiki/)
* [OpenKore forum](https://forums.openkore.com/)
* [IRC Channel](https://webchat.freenode.net/#openkore)
* [Connect IRC with Kiwiirc](https://kiwiirc.com/client/irc.freenode.net/?nick=IRC-Source_?#openkore)
* [Brazilian Community](http://openkorebrasil.org/)
* [Russian Community](https://RO-fan.ru/)

## **Warning**

Other communities or websites are not affiliated to openkore.com

## Other Links

1. [Openkore History](http://openkore.com/index.php/OpenKore)
2. [Legacy Changelog](https://github.com/OpenKore/openkore/blob/master/LegacyChangelog.md)
3. [Openkore RoadMap](http://openkore.com/index.php/Roadmap)
4. [Feature Requests and TODO Wiki](https://openkore.com/wiki/Category:Feature_Request) and [Feature Requests GitHub](https://github.com/OpenKore/openkore/issues?q=is%3Aopen+is%3Aissue+label%3A%22feature+request%22)

## License

This software is open source, licensed under the GNU General Public License, version 2.
Basically, this means that you're free to use and allowed to modify and distribute this software.
However, if you distribute modified versions, you **MUST** also distribute the source code.


See http://www.gnu.org/licenses/gpl.html for the full license.
