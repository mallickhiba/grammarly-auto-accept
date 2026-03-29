#Requires AutoHotkey v2.0
Esc::ExitApp

CoordMode "Pixel", "Screen"
CoordMode "Mouse", "Screen"
CoordMode "ToolTip", "Screen"

imgNormal := "C:\Users\Hiba\Desktop\accept_normal.png"
imgHover  := "C:\Users\Hiba\Desktop\accept_hover.png"

w := 73
h := 36
count := 0
noFindStreak := 0

left := A_ScreenWidth // 2
top := 0
right := A_ScreenWidth
bottom := A_ScreenHeight

AchievementSound() {
    SoundBeep 1047, 80  ; C6
    SoundBeep 1319, 80  ; E6
    SoundBeep 1568, 80  ; G6
    SoundBeep 2093, 150 ; C7
    Sleep 60
    SoundBeep 2637, 80  ; E7
    SoundBeep 2093, 300 ; C7 sparkle hold
}
Loop {
    found := false
    matchType := ""

    if ImageSearch(&x, &y, left, top, right, bottom, "*50 " imgHover) {
        found := true
        matchType := "hover"
    }
    else if ImageSearch(&x, &y, left, top, right, bottom, "*50 " imgNormal) {
        found := true
        matchType := "normal"
    }

    if found {
        noFindStreak := 0
        clickX := x + Round(w * 0.65)
        clickY := y + Round(h * 0.50)

        MouseMove clickX, clickY, 15  ; faster move
        Sleep 250                      ; shorter hover wait

        MouseGetPos &mx, &my
        ToolTip "Accepting...", mx + 15, my + 15

        Click
        count++

        Sleep 80
        MouseMove A_ScreenWidth // 2, A_ScreenHeight // 2, 15
        MouseGetPos &mx, &my
        ToolTip count " accepted!", mx + 15, my + 15

        Sleep 1200  ; shorter wait for Grammarly to load next
    } else {
        noFindStreak++
        MouseGetPos &mx, &my
        ToolTip "Searching... (" count " accepted)", mx + 15, my + 15

        if (noFindStreak >= 8) {
            ToolTip ""
            AchievementSound()
            MsgBox count " suggestions accepted!", "All done!", 64
            ExitApp
        }

        Sleep 500
    }
}