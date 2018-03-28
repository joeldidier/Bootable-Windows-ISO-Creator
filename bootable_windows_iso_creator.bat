:: This script is quite bad-written, please forgive me for this.
:: At least : it works.
@echo off
:: Here are global variables. Do not touch them !
set timestamp=%DATE:/=-%_%TIME::=-%
set timestamp=%timestamp: =%
set ScriptName=Bootable Windows ISO Creator
set ScriptVer=0.5.0-beta



:: End of global variables

@echo =====================================================> script.log
@echo Log Beginning>> script.log
@echo Script : %ScriptName%>> script.log
@echo Script Version : %ScriptVer%>> script.log
@echo Timestamp : %timestamp%>> script.log
@echo =====================================================>> script.log

goto AdminRightsRoutine

:: ================================================================
::                  Administrator Rights Checker
:: ================================================================

:AdminRightsRoutine
if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
	>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
		) else (
	>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
		)

if '%errorlevel%' NEQ '0' ( 
@echo User did not execute script as Administrator before prompting. User will be prompted now.>> script.log
goto PromptAdmin
) else ( 
	@echo User ran the script as Administrator before prompting.>> script.log
	goto GetAdminRightsSuccess 
)

:PromptAdmin
echo.
echo 				#########################################################
echo 				#  Bootable Windows ISO Creator - Request Admin Rights  #
echo 				#########################################################
echo.
echo Do you want to run this script as Administrator (Y/N) ?
echo This enables you to save the final ISO file in places where Admin rights are needed.
echo If you don't enter anything, the choice will be no.
set /p AdminAnswer=Enter Y (for Yes) or N (for No) : 
if "%AdminAnswer%" == "Y" ( goto GetAdminRights ) else ( goto RefusedPrivilegeEscalation )
if "%AdminAnswer%" == "y" ( goto GetAdminRights ) else ( goto RefusedPrivilegeEscalation )
if "%AdminAnswer%" == "Yes" ( goto GetAdminRights ) else ( goto RefusedPrivilegeEscalation )
if "%AdminAnswer%" == "yes" ( goto GetAdminRights ) else ( goto RefusedPrivilegeEscalation )
if "%AdminAnswer%" == "YES" ( goto GetAdminRights ) else ( goto RefusedPrivilegeEscalation )
if "%AdminAnswer%" == "YeS" ( goto GetAdminRights ) else ( goto RefusedPrivilegeEscalation )
if "%AdminAnswer%" == "yEs" ( goto GetAdminRights ) else ( goto RefusedPrivilegeEscalation )
if "%AdminAnswer%" == "1" ( goto GetAdminRights ) else ( goto RefusedPrivilegeEscalation )
if "%AdminAnswer%" == "" ( goto Menu) else ( goto RefusedPrivilegeEscalation )
:: Everything because everyone likes to enter what they are not asked for.

:RefusedPrivilegeEscalation
@echo User refused the prompted Privilege Escalation. This may cause errors depending on output folder.>> script.log
goto Menu


:GetAdminRights
@echo User chose to run the script as Administrator after prompting. Now acquiring Admin rights.>> script.log
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdminRights.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\GetAdminRights.vbs"
"%temp%\GetAdminRights.vbs"
del "%temp%\GetAdminRights.vbs"
exit /B


:GetAdminRightsSuccess
@echo Successfully got Administrator rights. Now heading to Menu.>> script.log
pushd "%CD%"
CD /D "%~dp0"
goto Menu

:: ================================================================
::                  Administrator Rights Checker
::                              End
:: ================================================================


:: ================================================================
::                          Interactive
:: ================================================================
:Menu
cls
echo.
echo 				#########################################################
echo 				#             Bootable Windows ISO Creator              #
echo                                 #                      Home Menu                        #
echo 				#########################################################
echo.
echo 	 # What do you want to do ?
echo.
echo 	[1] Recreate a bootable ISO
echo 	[2] Run as Admin
echo 	[3] Show the About section
echo 	[4] Exit
echo.
set /P c=	 Please enter your choice : 
if /I "%c%" EQU "1" goto BootableWizard
if /I "%c%" EQU "2" goto GetAdminRights
if /I "%c%" EQU "3" goto About
if /I "%c%" EQU "4" exit




:BootableWizard
cls
echo.
echo 				##################################################
echo 				#              Bootable ISO Wizard               #
echo 				##################################################
echo.
echo.
echo [1/6] Please enter the path to your source folder.
echo Example : if the folder "contents" located in "C:\WorkForce\" contains the image contents, type :
echo                                    C:\WorkForce\contents\
SET /P SourcePath=Enter Path to Source Folder : 
@echo User set the Source Path to %SourcePath%>> script.log

echo.
echo.
echo [2/6] Please enter where you want to save the ISO.
echo Example : if you want to save the ISO "Windows.iso" in the folder "ISO" located in "C:\WorkForce\", type :
echo                                    C:\WorkForce\ISO\Windows.iso
SET /P DestinationPath= 	Enter Path to Destination Folder :  
@echo User set the Destination Path to %DestinationPath%>> script.log
echo.
echo.
echo [3/6] Please enter the path to oscdimg.exe
echo Example : if oscdimg.exe is located in "C:\WorkForce\", type :
echo                                    C:\WorkForce\oscdimg.exe
SET /P OSCDIMGPath= 	Enter Path to oscdimg.exe : 
@echo User set the OSCDIMG Path to %OSCDIMGPath%>> script.log 
echo.
echo.
echo [4/6] Please enter the path to etfsboot.com
echo Example : if etfsboot.com is located in "C:\WorkForce\", type :
echo                                    C:\WorkForce\etfsboot.com
SET /P ETFSPath= 	Enter Path to etfsboot.com :  
@echo User set the ETFS Path to %ETFSPath%>> script.log 
echo.
echo.
echo [5/6] Please enter the path to efisys.bin
echo Example : if efisys.bin is located in "C:\WorkForce\", type :
echo                                    C:\WorkForce\efisys.bin
SET /P EFISYSPath= 	Enter Path to efisys.bin :   
@echo User set the EFISYS Path to %EFISYSPath%>> script.log
echo.
echo.
echo [6/6] Ready to go.
echo Here is a quick summary of the operation :
echo.
echo Source files are located in %SourcePath%
echo.
echo Path to the destination file : %DestinationPath%
echo.
echo Path to oscdimg.exe : %OSCDIMGPath%
echo.
echo Path to etfsboot.com : %ETFSPath%
echo.
echo Path to efisys.bin : %EFISYSPath%
echo.
pause
@echo Now processing.>> script.log
%OSCDIMGPath% -m -o -u2 -udfver102 -bootdata:2#p0,e,b%ETFSPath%#pEF,e,b%EFISYSPath% %SourcePath% %DestinationPath%>>script.log
if errorlevel 1 ( goto Error  ) else goto Success


:Error
echo.
echo [AN ERROR OCCURED]
echo The attempt seems to have failed.
echo.
echo Possible errors :
echo - You didn't have Administrator rights when you tried to save the ISO in a restricted-access folder ('Error 5 : Access is denied')
echo - Something interrupted the creation process (maybe an antivirus software ?)
echo - You used unauthorized characters in filenames / folder names
echo - This script has a bug and maybe there is no error (it happens !)
echo.
echo If the ISO image has been created and is full, try to boot it.
echo Please check script.log and/or send it to the developer.
echo.
pause
cls
goto Menu

:Success
echo.
echo.
echo Everything went well.
echo You can now boot the ISO image.
echo PLEASE NOTE : If the install.wim in the sources folder is over 4GB, you may not be able to boot it.
echo.
pause
cls
goto Menu


:About
cls
echo.
echo 				##################################################
echo 				#                     About                      #
echo 				##################################################
echo.
echo = Tool : %ScriptName%
echo.
echo = Version : %ScriptVer%
echo.
echo = Release date : March 28th 2018
echo.
echo = Author : Joel Didier
echo.
echo = IT Engeenering Student at exia.CESI (France)
echo.
echo = GitHub : https://github.com/Studisys/Bootable-Windows-ISO-Creator
echo.
echo = Website : studisys.net / studisys.fr
echo.
echo = Twitter : @Studisys (https://twitter.com/Studisys)
echo.
echo.
echo.
pause
cls
goto Menu