#Requires AutoHotkey v2.0
Esc::ExitApp

CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"
CoordMode "ToolTip", "Screen"

imgNormal := A_ScriptDir "\accept_normal.png"
imgHover  := A_ScriptDir "\accept_hover.png"

count := 0
noFindStreak := 0

left   := A_ScreenWidth // 2
top    := 0
right  := A_ScreenWidth
bottom := A_ScreenHeight

FinishSound() {
    SoundBeep 1047, 80
    SoundBeep 1319, 80
    SoundBeep 1568, 80
    SoundBeep 2093, 150
    Sleep 60
    SoundBeep 2637, 80
    SoundBeep 2093, 300
}

Loop {
    found := false

    if ImageSearch(&x, &y, left, top, right, bottom, "*50 " imgHover) {
        found := true
    }
    else if ImageSearch(&x, &y, left, top, right, bottom, "*50 " imgNormal) {
        found := true
    }

    if found {
        noFindStreak := 0

        ; x,y is top-left corner of matched image — click 20px right and 10px down
        clickX := x + 20
        clickY := y + 10

        MouseMove clickX, clickY, 15
        Sleep 250

        MouseGetPos &mx, &my
        ToolTip "Accepting...", mx + 15, my + 15

        Click
        count++

        Sleep 80
        MouseMove A_ScreenWidth // 2, A_ScreenHeight // 2, 15
        MouseGetPos &mx, &my
        ToolTip count " accepted!", mx + 15, my + 15

        Sleep 1200
    } else {
        noFindStreak++
        MouseGetPos &mx, &my
        ToolTip "Searching... (" count " accepted)", mx + 15, my + 15

        if (noFindStreak >= 8) {
            ToolTip ""
            FinishSound()
            MsgBox count " suggestions accepted!`n`nGrammarly is all clear.", "All done!", 64
            ExitApp
        }

        Sleep 500
    }
}
