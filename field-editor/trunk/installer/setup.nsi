; ---- Installer attributes ----

Name "OpenKore Field Editor"
SetCompressor /SOLID zlib
OutFile test.exe
SetPluginUnload alwaysoff
XPStyle on


; ---- Initialization ----

!include "MUI.nsh"
!include "WinMessages.nsh"

ReserveFile "dotnet.ini"
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

Function .onInit
	!insertmacro MUI_INSTALLOPTIONS_EXTRACT "dotnet.ini"
FunctionEnd


; ---- Global variables ----

var StartMenuName


; ---- Pages ----

!define MUI_ABORTWARNING

!insertmacro MUI_PAGE_WELCOME
page custom CheckDependencies CheckErrors
!insertmacro MUI_PAGE_DIRECTORY

!define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
!define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\OpenKore Field Editor"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
!insertmacro MUI_PAGE_STARTMENU OpenKore $StartMenuFolder

!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"


; ---- Sections ----

Section "Field Editor"
	SetOutPath $INSTDIR
	File ..\bin\Release\FieldEditor.exe
	WriteUninstaller $INSTDIR\uninstaller.exe
SectionEnd


; ---- Functions ----

Function CheckDependencies
	Banner::show /NOUNLOAD "Checking for .NET Framework..."
	call IsDotNETInstalled
	Banner::destroy
	pop $0
	StrCmp $0 1 done noDotNet

	noDotNet:
	SetErrors
	!insertmacro MUI_HEADER_TEXT "Microsoft .NET Framework not found" ""
	!insertmacro MUI_INSTALLOPTIONS_DISPLAY "ui.ini"
	goto done

	done:
FunctionEnd

Function CheckErrors
	IfErrors +1 done
	quit
	done:
FunctionEnd

Function IsDotNETInstalled
	Push $0
	Push $1

	System::Call "mscoree::GetCORVersion(w .r0, i ${NSIS_MAX_STRLEN}, *i) i .r1"
	StrCmp $1 0 foundDotNet noDotNet

	noDotNET:
	StrCpy $0 0
	Goto done

	foundDotNET:
	StrCpy $0 1

	done:
	Pop $1
	Exch $0
FunctionEnd
