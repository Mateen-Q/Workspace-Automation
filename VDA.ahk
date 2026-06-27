#Requires AutoHotkey v2.0
#SingleInstance Force

; ==========================================================
; Virtual Desktop Accessor Wrapper
; Requires:
;   VirtualDesktopAccessor.dll
;
; Place the DLL in the SAME folder as this script.
; ==========================================================

global VDA_PATH := A_ScriptDir "\VirtualDesktopAccessor.dll"

global hVDA := DllCall("LoadLibrary", "Str", VDA_PATH, "Ptr")

if (!hVDA)
{
    MsgBox "VirtualDesktopAccessor.dll not found!`n`nPlace it in the same folder as this script."
    ExitApp
}

global CreateDesktopProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "CreateDesktop", "Ptr")
global GetDesktopCountProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "GetDesktopCount", "Ptr")
global GetCurrentDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "GetCurrentDesktopNumber", "Ptr")
global GoToDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "GoToDesktopNumber", "Ptr")
global MoveWindowToDesktopNumberProc := DllCall("GetProcAddress", "Ptr", hVDA, "AStr", "MoveWindowToDesktopNumber", "Ptr")

VDA_CreateDesktop() {
    global CreateDesktopProc
    return DllCall(CreateDesktopProc, "Int")
}

VDA_GetDesktopCount() {
    global GetDesktopCountProc
    return DllCall(GetDesktopCountProc, "Int")
}

VDA_GetCurrentDesktop() {
    global GetCurrentDesktopNumberProc
    return DllCall(GetCurrentDesktopNumberProc, "Int")
}

VDA_GoToDesktop(num) {
    global GoToDesktopNumberProc
    return DllCall(GoToDesktopNumberProc, "Int", num, "Int")
}

MoveWindowToDesktop(hwnd, desktop) {
    global MoveWindowToDesktopNumberProc
    return DllCall(
        MoveWindowToDesktopNumberProc,
        "Ptr", hwnd,
        "Int", desktop,
        "Int"
    )
}
