; --------------------------------------------------------------------------------------
; Minimalizujemy okienko przy powdójnym naciśnięciu ESC > 2xEsc
; --------------------------------------------------------------------------------------

~Esc::
if (A_PriorHotkey <> "~Esc" or A_TimeSincePriorHotkey > 400)
{
    ; Too much time between presses, so this isn't a double-press.
    KeyWait, Esc
    return
}
WinMinimize, A
return

; --------------------------------------------------------------------------------------
; Wrzucanie daty do tekstu > ctrl+shift+d
; --------------------------------------------------------------------------------------
^+d::
FormatTime, CurrentDateTime,, yyyyMMdd{Space}
SendInput, %CurrentDateTime%
return

; --------------------------------------------------------------------------------------
; odpalanie przeglądarki > ctrl + f12
; --------------------------------------------------------------------------------------
^F12::
if not WinExist( "ahk_class MozillaWindowClass" )
{
		Run, % "C:\Program Files\Firefox Developer Edition\firefox.exe"
		WinActivate
}
else
{
    If WinActive("ahk_class MozillaWindowClass")
    {
       WinMinimize
    }
    else
    {
       WinActivate
    }
}
return
    
; --------------------------------------------------------------------------------------
; odpalanie totalcommander > ctrl+F11
; --------------------------------------------------------------------------------------
^F11::
if not WinExist( "ahk_class TTOTAL_CMD" )
{
		Run, % "c:\Program Files\totalcmd\TOTALCMD64.EXE " . path
		WinActivate
}
else
{
    If WinActive("ahk_class TTOTAL_CMD")
    {
       WinMinimize
    }
    else
    {
       WinActivate
    }
}
return

; --------------------------------------------------------------------------------------
;  aktywna klasa (co by wiedzieć które to okno:-) potrzbne dla: ahk_class TTOTAL_CMD
;  ctrl+shift+F7
; --------------------------------------------------------------------------------------

^+F7::
WinGetClass, class, A
MsgBox, The active window's class is "%class%".




