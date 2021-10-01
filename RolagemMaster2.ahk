
SetKeyDelay,0,0
;~ dano:=1
;~ q:=5
;~ npc:="Kobold"


Gui, Add, Text, x2 y9 w60 h20 +Center, Quantidade
Gui, Add, Text, x62 y9 w60 h20 +Center, NPC
Gui, Add, Text, x122 y9 w60 h20 +Center, Roll
Gui, Add, Text, x182 y9 w60 h20 +Center, Dano
Gui, Add, Edit, x2 y29 w40 h20 vq21, 1
Gui, Add, Edit, x48 y29 w90 h20 vn21, NPC
Gui, Add, Edit, x145 y29 w40 h20 vr21, d20+0
Gui, Add, Edit, x192 y29 w40 h20 vd21, d8+0
Gui, Add, Button, x242 y29 w40 h20 gb21, Roll
Gui, Add, Edit, x2 y54 w40 h20 vq22, 1
Gui, Add, Edit, x48 y54 w90 h20 vn22, NPC
Gui, Add, Edit, x145 y54 w40 h20 vr22, d20+0
Gui, Add, Edit, x192 y54 w40 h20 vd22, d6+0
Gui, Add, Button, x242 y54 w40 h20 gb22, Roll
Gui, Add, Edit, x2 y79 w40 h20 vq23,1
Gui, Add, Edit, x48 y79 w90 h20 vn23,NPC
Gui, Add, Edit, x145 y79 w40 h20 vr23,d20+0
Gui, Add, Edit, x192 y79 w40 h20 vd23,
Gui, Add, Edit, x2 y104 w40 h20 vq24,1
Gui, Add, Edit, x48 y104 w90 h20 vn24, NPC
Gui, Add, Edit, x145 y104 w40 h20 vr24,d20+0
Gui, Add, Edit, x192 y104 w40 h20 vd24,
Gui, Add, Button, x242 y79 w40 h20 gb23, Roll
Gui, Add, Button, x242 y104 w40 h20 gb24, Roll
Gui, Show, w289 h137, Rolador Mestre
gui,+alwaysontop
SysGet,area,MonitorWorkArea
ax:=areaRight-289
ay:=areaBottom-164
Gui, Show, w289 h137 x%ax% y%ay%, Rolagem
gui,submit,nohide
return


b21:
out:=""
gui,submit,nohide
if d21
	dano:=1
else
	dano:=0
loop,%q21%
{
	out .= r21 . ";"
	if dano
		out .= d21 . ";"
}
out.=""""
loop,%q21%
{
	if dano
		i:=2
	else
		i:=1
	out .= n21 . " " . A_Index . " Rolou $" . A_Index*i-(i-1) . " "
	if dano
		out .= "e $" . A_Index*2 . " na rolagem de Dano"
	if (A_Index < q21)
		out .= "`n"
}
SetTitleMatchMode, 2
WinActivate,Discord
temp:=Clipboard
Clipboard:=out
sendraw,!
send,^v
send,"`n
Sleep,100
Clipboard:=temp
return


b22:
out:=""
gui,submit,nohide
if d22
	dano:=1
else
	dano:=0
loop,%q22%
{
	out .= r22 . ";"
	if dano
		out .= d22 . ";"
}
out.=""""
loop,%q22%
{
	if dano
		i:=2
	else
		i:=1
	out .= n22 . " " . A_Index . " Rolou $" . A_Index*i-(i-1) . " "
	if dano
		out .= "e $" . A_Index*2 . " na rolagem de Dano"
	if (A_Index < q22)
		out .= "`n"
}
SetTitleMatchMode, 2
WinActivate,Discord
temp:=Clipboard
Clipboard:=out
sendraw,!
send,^v
send,"`n
Sleep,100
Clipboard:=temp
return


b23:
out:=""
gui,submit,nohide
if d23
{
	dano:=1
}
else
	dano:=0
loop,%q23%
{
	out .= r23 . ";"
	if dano
		out .= d23 . ";"
}
out.=""""
loop,%q23%
{
	if dano
		i:=2
	else
		i:=1
	out .= n23 . " " . A_Index . " Rolou $" . A_Index*i-(i-1) . " "
	if dano
		out .= "e $" . A_Index*2 . " na rolagem de Dano"
	if (A_Index < q23)
		out .= "`n"
}

SetTitleMatchMode, 2
WinActivate,Discord
temp:=Clipboard
Clipboard:=out
sendraw,!
send,^v
send,"`n
Sleep,100
Clipboard:=temp
return


b24:
out:=""
gui,submit,nohide
if d24
	dano:=1
else
	dano:=0
loop,%q24%
{
	out .= r24 . ";"
	if dano
		out .= d24 . ";"
}
out.=""""
loop,%q24%
{
	if dano
		i:=2
	else
		i:=1
	out .= n24 . " " . A_Index . " Rolou $" . A_Index*i-(i-1) . " "
	if dano
		out .= "e $" . A_Index*2 . " na rolagem de Dano"
	if (A_Index < q24)
		out .= "`n"
}
SetTitleMatchMode, 2
WinActivate,Discord
temp:=Clipboard
Clipboard:=out
sendraw,!
send,^v
send,"`n
Sleep,100
Clipboard:=temp
return


F8::
GuiClose:
ExitApp