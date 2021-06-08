#NoEnv
SetKeyDelay, 0, 50
#SingleInstance force
#NoEnv
SetWorkingDir %A_ScriptDir%
#Persistent
#InputLevel, 1
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#installKeybdHook
#UseHook On
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 10
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
Gui, -Caption 
Gui, Color, cFF9FE5
Gui, +ToolWindow
Gui, Font, cFF9FE5
Gui, Add, text,, K
Gui, +AlwaysOnTop +Owner
Gui, Show, NoActivate y-22 x960 NA
Suspend, On
Gui, Color, c202020
;##############################################################################################################################
;##############################################################################################################################
;##############################################################################################################################
;##############################################################################################################################
global FORCE := 1
global RESISTANCE := 0.982

global VELOCITY_X := 0
global VELOCITY_Y := 0



Accelerate(velocity, pos, neg) {
  If (pos == 0 && neg == 0) {
    Return 0
  }
  ; smooth deceleration :)
  Else If (pos + neg == 0) {
    Return velocity * 0.666
  }
  ; physicszzzzz
  Else {
    Return velocity * RESISTANCE + FORCE * (pos + neg)
  }
}
MoveCursor() {
        LEFT := 0
        DOWN := 0
        UP := 0
        RIGHT := 0

        UP := UP -  GetKeyState("w", "P")
        LEFT := LEFT - GetKeyState("a", "P")
        DOWN := DOWN + GetKeyState("s", "P")
        RIGHT := RIGHT + GetKeyState("d", "P")

        VELOCITY_X := Accelerate(VELOCITY_X, LEFT, RIGHT)
        VELOCITY_Y := Accelerate(VELOCITY_Y, UP, DOWN)

        MouseMove, %VELOCITY_X%, %VELOCITY_Y%, 0, R
}
;##############################################################################################################################
;#############################################################################################################################
;##############################################################################################################################
;############################################################################################################################
MonitorLeftEdge() {
  mx := 0
  CoordMode, Mouse, Screen
  MouseGetPos, mx
  monitor := (mx // A_ScreenWidth)

  return monitor * A_ScreenWidth
}




;inputttttttt
~f23::
Suspend, Off
Gui, Color, cFF9FE5
SetTimer, MoveCursor, 1
return
~f23 up::
Suspend, On
Gui, Color, c202020
SetTimer, MoveCursor, off
 return


,::return

.::RAlt
w:: Return
a:: Return
s:: Return
d:: Return


~Lshift & w::
x := 0
CoordMode, Mouse, Screen
MouseGetPos, x
MouseMove, x,0
Return
~Lshift & a::
x := MonitorLeftEdge() + 2
y := 0
CoordMode, Mouse, Screen
MouseGetPos,,y
MouseMove, x,y
Return
~Lshift & s::
x := 0
CoordMode, Mouse, Screen
MouseGetPos, x
MouseMove, x,(A_ScreenHeight - 0)
Return
~Lshift & d::
x := MonitorLeftEdge() + A_ScreenWidth - 2
y := 0
CoordMode, Mouse, Screen
MouseGetPos,,y
MouseMove, x,y
Return


e::
CoordMode, Mouse, Screen
MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2)
return

~Lshift & e::
wx := 0
wy := 0
width := 0
WinGetPos,wx,wy,width,,A
center := wx + width - 180
y := wy + 12
;MsgBox, Hello %width% %center%de 
MouseMove, center, y
Click, Down
return


r:: Click, WheelUp
f:: Click, WheelDown


space:: LButton
z:: 
keywait m  , U
Click, Down
return

c::RButton
q::
keywait n  , U
Click, Down Right
return

x:: MButton


1::f1
2::f2
3::f3
4::f4
5::f5
6::f6
7::f7
8::f8
9::f9
0::f10
-::f11
=::f12

g::PrintScreen
t::ScrollLock

h::Del
y::Insert
u::Home
j::end
i::PgUp
k::PgDn







[::Volume_Up
]::Volume_Down
\::Volume_Mute

,::Media_Stop
l::Media_Prev
SC027::Media_Play_Pause
'::Media_Next


Esc::`



/::up
Ralt::left
f23::right
AppsKey::down


