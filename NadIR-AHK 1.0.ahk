;Nombre: NadIr-AHK
;Autor: Crisspro
;Año: 2020
;Licencia: GPL 3.0


SetTitleMatchMode,2
#IfWinActive,NadIR 

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
SoundPlay,sonidos/off.wav
else
SoundPlay,sonidos/on.wav
Return
}

;activa y desactiva el canal 1
!1::
{
MouseClick,LEFT,115,199,1
PixelGetColor,color1,115,199
if (color1=0x202020)
SoundPlay,sonidos/on.wav
else
SoundPlay,sonidos/off.wav
Return
}

;activa y desactiva el canal 2
!2::
{
MouseClick,LEFT,535,199,1
PixelGetColor,color2,535,199
if (color2=0x999999)
SoundPlay,sonidos/on.wav
else
SoundPlay,sonidos/off.wav
Return
}