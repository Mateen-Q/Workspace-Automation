#Requires AutoHotkey v2.0
#SingleInstance Force

#Include VDA.ahk

; ==========================================================
;               USER CONFIGURATION
; ==========================================================

; Replace this with YOUR chrome.exe path.

chrome := "C:\this\is\where\your\chrome.exe\path\goes\chrome.exe"


; Modify this to add your URL(s) and profiles according to the README

Workspace := [
    { URL: "https://www.pinterest.com/", Profile: "Profile 4" },
    { URL: "https://www.photopea.com/",  Profile: "Profile 4" },
    { URL: "https://www.canva.com/",     Profile: "Profile 4" },
    { URL: "https://gemini.google.com/", Profile: "Profile 6" }
]

; ==========================================================

SetTimer(StartWorkspace, -300)

return

StartWorkspace()
{
    global Workspace

    while (VDA_GetDesktopCount() < Workspace.Length)
    {
        VDA_CreateDesktop()
        Sleep 500
    }

    VDA_GoToDesktop(0)
    Sleep 1000

    for index, site in Workspace
    {
        OpenSite(site.URL, site.Profile, index - 1)
    }

    Sleep 500
    VDA_GoToDesktop(0)
}

OpenSite(url, profile, desktop)
{
    global chrome

    Run '"' chrome '" --new-window --profile-directory="' profile '" "' url '"'

    Sleep 2000

    hwnd := WinGetID("A")

    WinMaximize "ahk_id " hwnd

    Sleep 300

    MoveWindowToDesktop(hwnd, desktop)

    Sleep 800
}
