# Design Workspace Automation

Automatically open multiple Chrome windows, each with a different profile and website, and place each window onto its own Windows Virtual Desktop.

Perfect for designers, developers, researchers, traders, students, or anyone who works with the same set of websites every day.


# Motivation for this automation: 

I sometimes design posters as my relaxation hobby, the idea for this project began as a simple need for automation to save myself from the tedious task of opening multiple chrome windows with different profiles, 
resizing them, arranging them on multiple desktops and so on, everytime I needed to design a poster, then I though many people probably use multiple desktops like me to streamline their workflow and make it efficient
so what if I could make a single universal script to do this? and here we are!

---

# Requirements

- Windows 11
- AutoHotkey v2
- Google Chrome
- VirtualDesktopAccessor.dll

---

# Project Structure

Create a folder like this:

DesignWorkspaceLauncher/

    Start Design Workspace.ahk
    VDA.ahk
    VirtualDesktopAccessor.dll

All three files **must be in the same folder.**

---

# 1. Install AutoHotkey v2

Download AutoHotkey v2:

https://www.autohotkey.com/

---

# 2. Download VirtualDesktopAccessor.dll

Go to:

https://github.com/Ciantic/VirtualDesktopAccessor/releases/tag/2024-12-16-windows11

Download:

VirtualDesktopAccessor.dll

Place it into the same folder as:

- Start Design Workspace.ahk
- VDA.ahk

Your folder should now look like:

DesignWorkspaceLauncher/

    Start Design Workspace.ahk
    VDA.ahk
    VirtualDesktopAccessor.dll

---

# 3. Configure Chrome

Open:

Start Design Workspace.ahk

You'll find:

```ahk
chrome := "C:\this\is\where\your\chrome.exe\path\goes\chrome.exe"
```

Replace it with your Chrome executable.

Example:

```text
C:\Program Files\Google\Chrome\Application\chrome.exe
```

or

```text
C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
```

## How to find chrome.exe

Method 1

Open Chrome

Go to

```
chrome://version
```

Look for:

Executable Path

Method 2

Navigate to

```
C:\Program Files\Google\Chrome\Application\
```

or

```
C:\Program Files (x86)\Google\Chrome\Application\
```

Copy the path.

---

# 4. Find your Chrome Profile Name

Open Chrome.

Visit:

```
chrome://version
```

Look for:

```
Profile Path
```

Example:

```
C:\Users\John\AppData\Local\Google\Chrome\User Data\Profile 4
```

Your profile name is:

```
Profile 4
```

Use exactly that string inside the script.

---

# 5. Configure your workspace

Edit:

```ahk
Workspace := [
    { URL: "...", Profile: "Profile 4" },
    { URL: "...", Profile: "Profile 4" },
    { URL: "...", Profile: "Profile 6" }
]
```

The current example Start Design Workspace.ahk attached in this project opens up pintrest, canva, gemini and photopea, which is what I use, but you can configure it to open any website by just modifying the urls and the profiles you intend to use.

You can:

- Add websites
- Remove websites
- Change Chrome profiles

The script automatically creates enough desktops.

Desktop numbering begins at 0.

Example:

```
Desktop 1 → 0
Desktop 2 → 1
Desktop 3 → 2
Desktop 4 → 3
```

---

# Running

Double-click:

Start Design Workspace.ahk

The launcher will:

- Create virtual desktops if needed
- Open every website
- Maximize every Chrome window
- Move each window onto its own desktop
- Return you to Desktop 1

The setup takes around 10 seconds.

During setup, avoid manually switching virtual desktops.

---

# Credits

- AutoHotkey v2
- Ciantic's VirtualDesktopAccessor
