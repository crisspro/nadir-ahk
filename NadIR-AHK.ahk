;Nombre: NadIr-AHK
;Autor: Crisspro
;Año: 2020
;Licencia: GPL-3.0


ScriptNombre:= "NadIR-AHK"
VSTNombre:= "NadIR"
VSTControl:= "VSTGUI"

xg:= 0
yg:= 0
VSTControlDetectado:= False
VSTNombreDetectado:= False


;Funciones

;habla mensajes
;Carga NVDA
nvdaSpeak(text)
{
Return DllCall("nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_speakText", "wstr", text)
}

hablar(es,en)
{
Lector:= "otro"
process, Exist, nvda.exe
if ErrorLevel != 0
{
Lector:= "nvda"
if (InStr(A_language,"0a") = "3")
nvdaSpeak(es)
else
nvdaSpeak(en)
}
process, Exist, jfw.exe
if ErrorLevel != 0
{
Lector:= "jaws"
Jaws := ComObjCreate("FreedomSci.JawsApi")
if (InStr(A_language,"0a") = "3")
Jaws.SayString(es)
else
Jaws.SayString(en)
}
If global Lector = "otro"
{
Sapi := ComObjCreate("SAPI.SpVoice")
Sapi.Rate := 5
Sapi.Volume :=90
if (InStr(A_language,"0a") = "3")
Sapi.Speak(es)
else
Sapi.Speak(en)
}
}

SetTitleMatchMode,2

;inicio del script
SoundPlay,sounds/start.wav, 1
hablar(ScriptNombre " activado",ScriptNombre " ready")

;detecta el plugin
loop
{
WinGet, VentanaID,Id,A
winget, controles, ControlList, A
IfWinActive,%VSTNombre%
{
VSTNombreDetectado:= True
loop, parse, controles, `n
{
if A_LoopField contains %VSTControl%
{
VSTControlDetectado:= True
ControlGetPos, x,y,a,b,%A_loopField%, ahk_id %VentanaID% 
xg:= x
yg:= y
break
}
else
VSTControlDetectado:= False
}
}
else
VSTNombreDetectado:= False
}


;atajos
#If VSTControlDetectado= True and VSTNombreDetectado= True


;cargar impulso del canal 1 
1::MouseClick,LEFT, xg+124, yg+171,1

;siguiente impulso del canal 1
f::
{
MouseClick,LEFT, xg+360, yg+188,1
hablar("siguiente","next")
return
}

; anterior impulso del canal 1
d::
{
MouseClick, LEFT, xg+103, yg+188,1
hablar("anterior", "back")
return
}

; lista de impulsos del canal 1
s::MouseClick LEFT, xg+220, yg+188,1

; cargar impulso del canal 2
2::MouseClick, LEFT, xg+562, yg+174,1

;siguiente impulso del canal 2
k::
{
MouseClick, LEFT, xg+785, yg+190,1
hablar("siguiente", "next")
return
}

;anterior impulso del canal 2
j::
{
MouseClick, LEFT, xg+532,yg+190,1
hablar("anterior", "back")
return
}

;lista de impulsos del canal 2
l::MouseClick, LEFT, xg+670, yg+190,1

;Menú para elegir modo
m::MouseClick LEFT, xg+508, yg+29,1

;Menú para cambiar calidad
c::MouseClick,LEFT, xg+631, yg+26,1

;activa y desactiva NadIR
!3::
{
MouseClick,LEFT, xg+371, yg+21,1
PixelGetColor,color3, xg+371, yg+21
if (color3=0xF2F2F2)
{
SoundPlay,sounds/off.wav
hablar("NadIR apagado", "NadIR off")
Return
}
else
{
SoundPlay,sounds/on.wav
hablar("NadIR encendido", "NadIR on")
Return
}
Return
}

;activa y desactiva el canal 1
!1::
{
MouseClick,LEFT, xg+107, yg+168,1
PixelGetColor,color1, xg+107, yg+168
if (color1=0x202020)
{
SoundPlay,sounds/off.wav
hablar("Canal 1 apagado", "Channel 1 off")
Return
}
else
{
SoundPlay,sounds/on.wav
hablar("Canal 1 encendido", "Channel 1 on")
Return
}
Return
}

;activa y desactiva el canal 2
!2::
{
MouseClick,LEFT, xg+527,yg+168,1
PixelGetColor,color2, xg+527, yg+168
if (color2=0x999999)
{
SoundPlay,sounds/off.wav
hablar("Canal 2 apagado", "Channel 2 off")
Return
}
else
{
SoundPlay,sounds/on.wav
hablar("Canal 2 encendido", "Channel 2 on")
Return
}
Return
}

f1::
{
if (InStr(A_language,"0a") = "3")
Run Documentation\es.html
else
Run Documentation\en.html
Return
}

^q::
{
hablar(ScriptNombre " cerrado",ScriptNombre " closed")
SoundPlay,sounds/exit.wav,1
ExitApp
return
}
