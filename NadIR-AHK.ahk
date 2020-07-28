;Nombre: NadIr-AHK
;Autor: Crisspro
;Año: 2020
;Licencia: GPL 3.0

#include nvda.ahk
SetTitleMatchMode,2
#IfWinActive,NadIR 
;sonido de inicio
SoundPlay,sounds/start.wav
;mensaje de inicio
if (A_languaje = *"0a")
nvdaSpeak("NadIr-AHK activado")
else
nvdaSpeak("NadIR-AHK ready")
Return

;cargar impulso del canal 1 
1::MouseClick,LEFT,132,202,1
;siguiente impulso del canal 1
f::MouseClick,LEFT,368,219,1
; anterior impulso del canal 1
d::MouseClick, LEFT,111, 221,h1
; lista de impulsos del canal 1
s::MouseClick LEFT,228,216,ass 1
; cargar impulso del canal 2
2::MouseClick, LEFT,570, 205,1
;siguiente impulso del canal 2
k::MouseClick, LEFT,793, 221,1
;anterior impulso del canal 2f
j::MouseClick, LEFT,540,222,1
;lista de impulsos del canal 2
l::MouseClick, LEFT,701, 218,1
;Menú para elegir modo
m::MouseClick LEFT,516,60,1
;Menú para cambiar calidad
c::MouseClick,LEFT,741, 141,1
;activa y desactiva NadIR
!3::
{
MouseClick,LEFT,379, 52,1
PixelGetColor,color3,379,52
if (color3=0xF2F2F2)
{
SoundPlay,sounds/off.wav
if (A_languaje = *"0a")
nvdaSpeak("NadIR apagado")
else
nvdaSpeak("NadIR off")
Return
}
else
{
SoundPlay,sounds/on.wav
if (A_languaje = *"0a")
nvdaSpeak("NadIR encendido")
else
nvdaSpeak("NadIR on")
Return
}
Return
}

;activa y desactiva el canal 1
!1::
{
MouseClick,LEFT,115,199,1
PixelGetColor,color1,115,199
if (color1=0x202020)
{
SoundPlay,sounds/off.wav
if (A_languaje = *"0a")
nvdaSpeak("Canal 1 apagado")
else
nvdaSpeak("Channel 1 off")
Return
}
else
{
SoundPlay,sounds/on.wav
if (A_languaje = *"0a")
nvdaSpeak("Canal 1 encendido")
else
nvdaSpeak("Channel 1 on")
Return
}
Return
}

;activa y desactiva el canal 2
!2::
{
MouseClick,LEFT,535,199,1
PixelGetColor,color2,535,199
if (color2=0x999999)
{
SoundPlay,sounds/off.wav
if (A_languaje = *"0a")
nvdaSpeak("Canal 2 apagado")
else
nvdaSpeak("Channel 2 off")
Return
}
else
{
SoundPlay,sounds/on.wav
if (A_languaje = *"0a")
nvdaSpeak("Canal 2 encendido")
else
nvdaSpeak("Channel 2 on")
Return
}
Return
}