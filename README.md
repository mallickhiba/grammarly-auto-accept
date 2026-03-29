# grammarly-auto-accept


# Grammarly Auto Accept

Automatically accepts all Grammarly suggestions one by one — no clicking required.
Built with AutoHotkey v2 for Windows.

## How it works

The script scans your screen for the green Accept button, moves the mouse over it
to trigger Grammarly's hover state, clicks it, then waits for the next suggestion
to load. Repeats until all suggestions are done, then plays a sound and exits.

## Requirements

- Windows
- AutoHotkey v2 — download at https://www.autohotkey.com/
- Grammarly open in Chrome at app.grammarly.com

## Setup

### 1. Install AutoHotkey v2
Download and install from https://www.autohotkey.com/

### 2. Download the script
Download `grammarly.ahk` from this repo and save it to your Desktop.

### 3. Take your own button screenshots
The script uses image matching to find the Accept button, so you need to take
screenshots on YOUR screen for it to work correctly (different screen scales
and resolutions produce different images).

**Step 1** — Open Grammarly at app.grammarly.com with a document that has suggestions.

**Step 2** — Press `Win + Shift + S` to open the snipping tool. Crop tightly around
just the green Accept button. Save to your Desktop as `accept_normal.png`.

**Step 3** — Hover your mouse over the Accept button (it gets slightly lighter).
Take another screenshot the same way. Save as `accept_hover.png`.

> Crop as tightly as possible — just the button, no surrounding whitespace.

### 4. Run it
Double-click `grammarly.ahk`. A green H icon will appear in your taskbar.

## Usage

- Open your Grammarly document in Chrome
- Double-click `grammarly.ahk`  
- A tooltip near your cursor shows accepted count as it runs
- When finished, a chime plays and a popup shows the total
- Press **Escape** at any time to stop

## Troubleshooting

**Script can't find the button**
Your display scaling may differ. Go to Display Settings and check your Scale %.
Retake both screenshots at your current scaling and try again.

**Script accepts wrong things**
Your screenshots are matching something else. Retake them more tightly cropped
around just the button and try again.

**Script gets stuck on one suggestion**
Click Accept manually once — it will continue automatically after that.

## Notes

- Works on app.grammarly.com in Chrome
- Does not work with the Grammarly for Google Docs extension (different architecture)
- Pro/paywalled suggestions are skipped automatically
- Tested on Windows 11 with Chrome

## Files

| File | Description |
|---|---|
| `grammarly.ahk` | Main script |
| `accept_normal.png` | Your screenshot of the Accept button (you take this) |
| `accept_hover.png` | Your screenshot of the hovered Accept button (you take this) |

## Stopping the script

Press **Escape** or right-click the green H icon in taskbar → Exit.
