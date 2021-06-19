#Persistent
#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Init:
    Menu Tray, NoStandard
    Menu Tray, Add, Run on startup, RunOnStartup
    Menu Tray, Standard
    RegRead, runOnStartup, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Trackball Back Forward

  If (runOnStartup = "") {
      runOnStartup := false
  } Else {
      runOnStartup := true
      Menu Tray, Check, Run on startup
      RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Trackball Back Forward, %A_ScriptFullPath%
  }
return

RunOnStartup:
    If (runOnStartup) {
        Menu %A_ThisMenu%, UnCheck, %A_ThisMenuItem%
        runOnStartup := false
        RegDelete, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Trackball Back Forward
    } Else {
        Menu %A_ThisMenu%, Check, %A_ThisMenuItem%
        runOnStartup := true
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Trackball Back Forward, %A_ScriptFullPath%
    }
return

^MButton::XButton1
^!MButton::XButton2

