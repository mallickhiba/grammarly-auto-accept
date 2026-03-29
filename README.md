# grammarly-auto-accept

Automatically accepts all Grammarly suggestions one by one — no clicking required.
Built with AutoHotkey v2 for Windows.

## How it works

The script scans your screen for the green Accept button using image matching,
moves the mouse over it to trigger Grammarly's hover state, then clicks it.
Repeats until all suggestions are done, then plays a sound and exits.

## Requirements

- Windows
- AutoHotkey v2 — download at https://www.autohotkey.com/
- Grammarly open in Chrome — works on both app.grammarly.com and the Google Docs Grammarly extension

## Setup

### 1. Install AutoHotkey v2
Download and install from https://www.autohotkey.com/download/ahk-v2.exe

### 2. Download the script
Download `grammarly.ahk` from this repo and put it in a folder on your computer.

### 3. Take your own button screenshots
The script uses image matching to find the Accept button, so you need screenshots
taken on YOUR screen.

**Step 1** — Open Grammarly with a document that has at least one suggestion visible.

**Step 2** — Press `Win + Shift + S` to open the snipping tool. Crop tightly around
just the green Accept button with no surrounding whitespace 
(Check files accept_normal.png and accept_hover.png for reference). 

Save it in the same folder as `grammarly.ahk` as:
```
accept_normal.png
```

**Step 3** — Hover your mouse over the Accept button (it gets slightly darker).
Take another screenshot the same way. Save it in the same folder as:
```
accept_hover.png
```

### 4. Run it
Double-click `grammarly.ahk`. A green H icon will appear in your taskbar.

## Usage

- Open your Grammarly document with a suggestion with an Accept button visible.
- Double-click `grammarly.ahk`
- A tooltip near your cursor shows the running count as it works
- When finished, a chime plays and a popup shows the total accepted
- Press **Escape** at any time to stop

## Troubleshooting

**Script can't find the button**
Retake both screenshots more tightly cropped around just the button and try again.

**Script gets stuck on one suggestion**
Click Accept manually once — it will continue automatically after that.

## Notes

- Works on app.grammarly.com in Chrome and with the Grammarly extension on Google Docs
- Pro/paywalled suggestions are skipped automatically
- Tested on Windows 11 with Chrome

## Files

| File | Description |
|---|---|
| `grammarly.ahk` | Main script |
| `accept_normal.png` | Your screenshot of the Accept button (you provide this) |
| `accept_hover.png` | Your screenshot of the hovered Accept button (you provide this) |

## Stopping the script

Press **Escape** or right-click the green H icon in taskbar → Exit.
