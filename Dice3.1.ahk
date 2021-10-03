if(!FileExist(rolador.cfg))
{
	FileAppend,Nome do Personagem`nAtaque Primário`nd20+0`nd6+0`nAtaque Secundário`nd20+0`nd6+0`nOutro`nd20+0`n`nIniciativa`nd20+0`n`n,rolador.cfg
}
FileRead,config,rolador.cfg
config:=StrSplit(config,"`n","`r`n")
nome:=config[1]
a21:=config[2]
r21:=config[3]
d21:=config[4]
a22:=config[5]
r22:=config[6]
d22:=config[7]
a23:=config[8]
r23:=config[9]
d23:=config[10]
a24:=config[11]
r24:=config[12]
d24:=config[13]
FileDelete,rolador.cfg

SetKeyDelay,0,0
Gui, Add, Text, x5 y7 w40 h20 , Nome:
Gui, Add, Text, x42 y26 w120 h20 Center, Descrição
Gui, Add, Text, x172 y26 w50 h20 Center, Rolagem
Gui, Add, Text, x232 y26 w50 h20 Center, Dano
Gui, Add, Button, x5 y40 w30 h20 gRoll21, F1
Gui, Add, Button, x5 y70 w30 h20 gRoll22, F2
Gui, Add, Button, x5 y100 w30 h20 gRoll23, F3
Gui, Add, Button, x5 y130 w30 h20 gRoll24, F4
Gui, Add, Edit, x42 y5 w230 h20 vnome,%nome%
Gui, Add, Edit, x42 y40 w120 h20 va21,%a21%
Gui, Add, Edit, x172 y40 w50 h20 vr21,%r21%
Gui, Add, Edit, x232 y40 w50 h20 vd21,%d21%
Gui, Add, Edit, x42 y70 w120 h20 va22,%a22%
Gui, Add, Edit, x172 y70 w50 h20 vr22,%r22%
Gui, Add, Edit, x232 y70 w50 h20 vd22,%d22%
Gui, Add, Edit, x42 y100 w120 h20 va23,%a23%
Gui, Add, Edit, x172 y100 w50 h20 vr23,%r23%
Gui, Add, Edit, x232 y100 w50 h20 vd23,%d23%
Gui, Add, Edit, x42 y130 w120 h20 va24,%a24%
Gui, Add, Edit, x172 y130 w50 h20 vr24,%r24%
Gui, Add, Edit, x232 y130 w50 h20 vd24,%d24%
Gui,Add,CheckBox,x285 y36 vva21 gCheck1,V
Gui,Add,CheckBox,x285 y49 vde21 gCheck2,D
Gui,Add,CheckBox, x285 y66 vva22 gCheck3,V
Gui,Add,CheckBox,x285 y79 vde22 gCheck4,D
Gui,Add,CheckBox, x285 y96 vva23 gCheck5,V
Gui,Add,CheckBox,x285 y109 vde23 gCheck6,D
Gui,Add,CheckBox, x285 y126 vva24 gCheck7,V
Gui,Add,CheckBox,x285 y139 vde24 gCheck8,D
Gui,Font,s7,Arial
Gui, Add, Text,x275 y5 w40 h15, Vantagem
Gui, Add, Text, x275 y18 w40 h15, Desvantagem
SetTitleMatchMode, 2
gui,+alwaysontop
SysGet,area,MonitorWorkArea
ax:=areaRight-316
ay:=areaBottom-188
ax:=A_ScreenWidth-316
ay:=A_ScreenHeight-230
Gui, Show, w316 h164 x%ax% y%ay%, Rolagem
return


F1::
Roll21:
Roll(nome,21)
return

F2::
Roll22:
Roll(nome,22)
return

F3::
Roll23:
Roll(nome,23)
return

F4::
Roll24:
Roll(nome,24)
return


Roll(nome,r)
{
	gui,submit,nohide
	out:="!"
	if !inStr(r%r%,"+") and !inStr(r%r%,"-")
		r%r% .= "+0"
	if va%r% or de%r%
		out .= "d20;"
	r%r% := StrReplace(r%r%,"+",";$1+")
	r%r% := StrReplace(r%r%,"-",";$1-")
	if va%r%
		r%r% := StrReplace(r%r%,";","bk1;")
	if de%r%
		r%r% := StrReplace(r%r%,";","bkl1;")
	out.= r%r% . ";"
	if d%r%
	{
		if !inStr(d%r%,"+") and !inStr(d%r%,"-")
			d%r% .= "+0"
		d%r% := StrReplace(d%r%,"+",";$3+")
		d%r% := StrReplace(d%r%,"-",";$3-")
		out .= d%r% . ";" 

	}
	out .= """" . nome . " - " . a%r% . " - Rolagem: $2 ($1)"
	if va%r%
		out .= " com Vantagem"
	if de%r%
		out .= " com Desvantagem"
	if d%r%
		out.= " e para dano $4 ($3)"
	out .= """"
	if va%r% or de%r%
	{
		out := StrReplace(out,"$4","$5")
		out := StrReplace(out,"$3","$4")
		out := StrReplace(out,"$2","$3")
		out := StrReplace(out,"$1","$2")
		out := StrReplace(out,"($2)","($1,$2)")
		
	}
	
	SetTitleMatchMode, 2
	WinActivate,Discord
	temp:=Clipboard
	Clipboard:=out
	send,^v
	send,`n
	Sleep,100
	Clipboard:=temp
}



Check1:
GuiControl,,de21,0
return

Check2:
GuiControl,,va21,0
return

Check3:
GuiControl,,de22,0
return

Check4:
GuiControl,,va22,0
return

Check5:
GuiControl,,de23,0
return

Check6:
GuiControl,,va23,0
return

Check7:
GuiControl,,de24,0
return

Check8:
GuiControl,,va24,0
return


GuiClose:
gui,submit,nohide
FileAppend,%nome%`n%a21%`n%r21%`n%d21%`n%a22%`n%r22%`n%d22%`n%a23%`n%r23%`n%d23%`n%a24%`n%r24%`n%d24%`n,rolador.cfg
ExitApp

