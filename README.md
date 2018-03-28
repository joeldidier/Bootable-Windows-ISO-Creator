<p align="center">
<a href="https://twitter.com/Studisys">
  <img width="300" height="82" src="https://studisys.net/github/projects/studisys-logo-inline-dark.png"></a>
  <br/><br/>
   <img src="https://studisys.net/github/projects/Bootable-Windows-ISO-Creator/5.png">
  <br/>
 </p>
 
----------
# Welcome to the Bootable Windows ISO Creator Project !

<p align="center">
<a href="https://blog.studisys.net">
  <img  src="https://studisys.net/github/projects/Bootable-Windows-ISO-Creator/1.png"></a>
  <br/>
 </p>
 
 <p align="center">
  Simply copying Windows installation files into an ISO image doesn't make a bootable ISO Image.
This script allows to create a bootable Windows ISO image from a Windows installation source folder (the contents of an actual ISO file).
  <br/>
 </p>



<p align="center">
<a href="https://blog.studisys.net">
  <img  src="https://studisys.net/github/projects/Bootable-Windows-ISO-Creator/2.png"></a>
  <br/>
  These are the contents of a Windows ISO Image
 </p>


## Compatibility
This script only works on Windows systems.
This script is currently ***only*** tested on **Windows 10**.
It was last tested on ***Windows 10 Education Insider Preview Build 17627 (Skip Ahead)***
It will soon be tested on Windows Vista, 7, 8, 8.1, and Windows Server 2008 (R2), 2012 (R2).

# How to Use

1. Download the zip and extract it.
**IMPORTANT :** This script relies on the ***`OSCDIMG`*** tool (`oscdimg.exe`) , the ***`etfsboot.com`*** and ***`efisys.bin`*** files provided by Microsoft. If you already have installed the [Windows ADK](https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install) with the Deployment and Imaging Tools Environment, you're not obligated to use the files located in the oscdimg folder provided with this script. However, if you do not have these files on your computer, I strongly advise you to download and use them.

 2. Run the script ***`bootable_windows_iso_creator.bat`*** located in the extracted folder.
 ***Note :*** If you didn't run the script as Administrator, you will be prompted if you want Administrator rights. You're not obligated to accept, and refusing will not prevent the script from running, except in a specific case. For more information, please see the *Practical Notes* from the *Important Notes* section below.
 3. Type ***`1`*** to enter the ISO Creation Wizard.

Here begins the main part :

 4. Enter the path to the Windows Installation folder.
**Example :** if the folder  `contents`  located in  `C:\WorkForce\`  contains the image contents, type :  <p align="center">`C:\WorkForce\contents\`</p>

 5. Enter the path to the destination file.
**Example :** if you want to save the ISO as `Windows.iso`  in the folder  `ISO`  located in  C:\WorkForce\ , type :  <p align="center">`C:\WorkForce\ISO\Windows.iso`</p>


 6. Enter the path to the oscdimg.exe tool.
**Note 1 :** Use the x86 version if you wish to create a 32-Bits ISO of Windows, or amd64 (x64) if you wish to create a 64-Bits ISO.

	**Note 2 :** You can use the provided files in the repository. You need to type the full path to the file, not the relative path.
	
	**Note 3 :** If you did not install the Windows ADK with the Deployment and Imaging Tools Environment, please install it or download `oscdimg.exe`, `etfsboot.com`and `efisys.bin` from this repository.

	**Note 4 :** If you installed the Windows ADK with the Deployment and Imaging Tools Environment, here is the default path to the file :

 - 32-Bits : 
	 - C:\Program Files (x86)\Windows Kits\`**<version>**`\Assessment and Deployment Kit\Deployment Tools\x86\Oscdimg\oscdimg.exe

 - 64-Bits :
	 - C:\Program Files (x86)\Windows Kits\<version>\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe

Where `<version>` is 8, 8.1 or 10 according to your Windows version.

7. Enter the path to `etfsboot.com`.
**Note :** The file should be in the same folder as oscdimg.exe.

8. Enter the path to `efisys.bin` .
**Note :** Use the x86 version if you wish to create a 32-Bits ISO of Windows, or amd64 (x64) if you wish to create a 64-Bits ISO.

9. Validate and let the fun begin.

# Demo
Here is an actual demo.
In this scenario, I downloaded the ZIP archive provided in this repository in my Downloads folder, and I extracted it.
I decide to use the provided files.
Here is the result :

<p align="center">
<a href="https://blog.studisys.net">
  <img  src="https://studisys.net/github/projects/Bootable-Windows-ISO-Creator/4.gif"></a>
  <br/>
 </p>
 



# Important Notes
## Practical Notes
### Administrator-rights
 - This script does not require Administrator rights to run
 - However, if choose to save the final ISO in a restricted-access folder (a folder that requires specific rights, like Administrator rights, to save files in it) without the required privileges, you will get an error.
 - Folders that do not require any specific right are, for example : Desktop Folder, Downloads Folder, Documents Folder, …


### Security

 - This tools uses sensitive files (oscdimg.exe, etfsboot.com, efisys.bin) that are provided by Microsoft.
 - Malware can spread onto new Windows installations by infecting this files, which explains why they are sensitive.
 - The provided files in this repository are directly extracted from the [Windows Insider Preview ADK](https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewADK) (Build 17120)
- The SHA1 hash of the files provided in this repository are :
	- 32-Bits (x86) :
		- oscdimg.exe : f6430f013a60aa16e6f55255adefe95d546f400a
		- efisys.bin : 2e8552a0f53dd6f442a4c60b7ac7d548d0e0cd4f
		- efisys_noprompt.bin : 4e6ce0781efc6b810a20c45ec6fed4302054f1d4
		- etfsboot.com : 62313ec73f381c052f2513ca6279cfb5107e98c0


	- 64-Bits (x64) :
		- oscdimg.exe : 09cdeacd36633bea60f01676d54b7d94fca36e94
		- efisys.bin : cfb0ca0b29381342ff1eef70a65e27e6997ce660
		- efisys_noprompt.bin : e8a7f44150c03c7173862ef9f949b35e4b78f25b
		- etfsboot.com : 62313ec73f381c052f2513ca6279cfb5107e98c0

You can verify the hash of the provided files with tools like [HashMyFiles](http://www.nirsoft.net/utils/hash_my_files.html) or [HashCheck](http://code.kliu.org/hashcheck/).

**Example :** After installing HashCheck, you simply have to click on the checksums.sha1 file to verify the files present in the folder. Each file having the correct SHA1 will display in Green (Red if wrong SHA1, Yellow if not present).
An example below :

<p align="center">
<a href="https://blog.studisys.net">
  <img  src="https://studisys.net/github/projects/Bootable-Windows-ISO-Creator/3.gif"></a>
  <br/>
 </p>
 
 



# More about this project

  
  

## Origin

I'm working on another project which creates updated Windows installation files and I wanted to provide a way for the regular user to recreate a bootable Windows ISO.
  
## Upcoming features


- Allow to detect current Windows ADK installation to use preinstalled files
- Add an unattended mode
 

## Versioning


### This script creates :

- %temp%\\\GetAdminRights.vbs

	- For the Administrator Rights if script was not run as Administrator

- An ISO file, which name and directory are provided by the user

 - script_directory/script.log
	 - Logs various infos and errors that can be sent to the developer to help investigate


### This script runs :

- %temp%\\\GetAdminRights.vbs

	- Run cmd.exe as admin if the script was not executed as it

- %systemroot%\\system32\\cmd.exe

	- Runs as admin to operate if necessary

- /path/to/oscdimg.exe
	- Part of the Windows Imaging Tools (path specified by user)


## Versioning

I'm tyring to keep versioning as clean as possible. Here is the system I'm using :

  

- 3-digit version [Major].[Beta].[Alpha]

- [Major] : number of the stable version

- [Beta] : number of the Beta version (number of bugs greatly reduced comparing to the Alpha version)

- [Alpha] : number of the Alpha version (highest number of bugs, features not properly working)

  

## Changelog

A changelog can be found [here](https://github.com/Studisys/Bootable-Windows-ISO-Creator/blob/master/CHANGELOG).

  

## License [<img src="https://img.shields.io/badge/license-AGPL 3.0-blue.svg">](https://github.com/Studisys/Bootable-Windows-ISO-Creator/blob/master/LICENSE)

This project is licensed under the AGPL 3.0 License.

The license file can be viewed [here](https://github.com/Studisys/Bootable-Windows-ISO-Creator/blob/master/LICENSE).

Here are the great lines to remember of this license :

 - <img src="https://img.shields.io/badge/Commercial%20use%20:-Allowed-brightgreen.svg">
  - <img src="https://img.shields.io/badge/Distribution%20:-Allowed-brightgreen.svg">
  - <img  src="https://img.shields.io/badge/Modification%20:-Allowed-brightgreen.svg">
  - <img  src="https://img.shields.io/badge/Patent%20use%20:-Allowed-brightgreen.svg">
  - <img  src="https://img.shields.io/badge/Private%20use%20:-Allowed-brightgreen.svg">
 - <img  src="https://img.shields.io/badge/Disclose%20source%20:-Mandatory-blue.svg">
- <img  src="https://img.shields.io/badge/License%20and%20copyright%20notice%20:-Mandatory-blue.svg">
- <img  src="https://img.shields.io/badge/Network%20use%20is%20distribution%20:-Mandatory-blue.svg">
- <img  src="https://img.shields.io/badge/Same%20license%20:-Mandatory-blue.svg">
- <img  src="https://img.shields.io/badge/State%20changes%20:-Mandatory-blue.svg">
- <img  src="https://img.shields.io/badge/Liability%20:-None-red.svg">
- <img  src="https://img.shields.io/badge/Warranty%20:-None-red.svg">

## Contact and useful links

Thanks for browsing through this project !

Here a few links on how to reach me and/or find me online :

  

 - Personal website : https://studisys.net
   
  - Personal blog (English) : https://studisys.net/blog
   
   - Site Web Personnel :https://studisys.fr
   - Blog Personnel (Français) : https://studisys.fr/blog
   - Twitter :  https://twitter.com/Studisys
   
   - LinkedIn :  https://linkedin.com/in/joel-didier
   
   - Email : studisys@protonmail.com
