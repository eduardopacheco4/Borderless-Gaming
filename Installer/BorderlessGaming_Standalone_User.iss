[Setup]
AppName=Borderless Gaming
AppPublisher=Codeusa Software
AppCopyright=Copyright (C) 2014-2015 Codeusa Software
DefaultDirName={pf}\Borderless Gaming
DefaultGroupName=Borderless Gaming
OutputDir=./
DisableReadyMemo=yes
DisableReadyPage=yes
SetupIconFile=../BorderlessGaming_new.ico
Compression=lzma/ultra64
SolidCompression=yes
LicenseFile=../LICENSE
Uninstallable=yes
; Needed to modify %AppData%
PrivilegesRequired=admin
DisableProgramGroupPage=yes
DirExistsWarning=no

; Shown as installed version (Programs & Features) as well as product version ('Details' tab when right-clicking setup program and choosing 'Properties')
AppVersion=9.1
; Stored in the version info for the setup program itself ('Details' tab when right-clicking setup program and choosing 'Properties')
VersionInfoVersion=9.1.33315.1328
; Other version info
OutputBaseFilename=BorderlessGaming_9.1__setup


; Shown in the setup program during install only
AppVerName=Borderless Gaming v9.1

; Shown only in Programs & Features
AppContact=Borderless Gaming on Github
AppComments=Play your favorite games in a borderless window; no more time-consuming Alt-Tabs!
AppPublisherURL=https://github.com/Codeusa/Borderless-Gaming
AppSupportURL=https://github.com/Codeusa/Borderless-Gaming/issues
AppUpdatesURL=https://github.com/Codeusa/Borderless-Gaming/releases/latest
UninstallDisplayName=Borderless Gaming
; 691 KB as initial install
UninstallDisplaySize=929008
UninstallDisplayIcon={app}\BorderlessGaming.exe


[Messages]
BeveledLabel=Borderless Gaming 9.1 Setup

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Files]
Source: ../bin/Standalone_User/Release/BorderlessGaming.exe; DestDir: {app}; Flags: ignoreversion
Source: ../bin/Standalone_User/Release/Interop.IWshRuntimeLibrary.dll; DestDir: {app}
Source: ../bin/Standalone_User/Release/Newtonsoft.Json.dll; DestDir: {app}

Source: ../LICENSE; DestName: License.txt; DestDir: {app}
Source: ../README.md; DestName: Read Me.txt; DestDir: {app}
Source: ./uninstall.ico; DestDir: {app}

[Tasks]
;Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons};

[Icons]
Name: {commondesktop}\Borderless Gaming; Filename: {app}\BorderlessGaming.exe; WorkingDir: {app}; Tasks: desktopicon
Name: {group}\Borderless Gaming; Filename: {app}\BorderlessGaming.exe; WorkingDir: {app}
Name: {group}\Uninstall Borderless Gaming; Filename: {uninstallexe}; IconFileName: {app}\uninstall.ico
Name: {group}\License Agreement; Filename: {app}\License.txt
Name: {group}\Read Me; Filename: {app}\Read Me.txt

[Run]
Description: Start Borderless Gaming; Filename: {app}\BorderlessGaming.exe; Flags: nowait postinstall skipifsilent shellexec

[UninstallDelete]
Type: files; Name: {app}\License.txt
Type: files; Name: {app}\Read Me.txt
Type: files; Name: {app}\BorderlessGaming.exe
Type: files; Name: {app}\Interop.IWshRuntimeLibrary.dll
Type: files; Name: {app}\Newtonsoft.Json.dll
Type: files; Name: {app}\uninstall.ico

[Code]
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usUninstall then begin
    if MsgBox('Do you want to delete your Borderless Gaming settings and preferences as well?', mbConfirmation, MB_YESNO) = IDYES 
    then begin
      DelTree(ExpandConstant('{app}'), True, True, True)
    end;
  end;
end;
