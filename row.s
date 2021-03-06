#include <avr/io.h>
#include "defs.h"

.global renderRow

.section .text

; Assuming:
; ZH == 0x01 (Start of sine table in RAM)
; XH == 0x02 (Start of palette table in RAM)
.macro HORIZONTAL_PIXEL_MACRO
    ld      XL,  Z+         ; (2) Load from the sine table
    andi    ZL,  0b00011111 ; (1) Restrain index in table to [0,31]
    add     XL,  r17        ; (1) r17 Contains 'a'
    swap    XL              ; (1) Divide by 16
    andi    XL,  0b00001111 ; (1)
    ld      r16, X          ; (2) Load from the palette table
    out     portc, r16      ; (1) Put the color on the output port
.endm


;**
;* This is kind of ugly, but there is plenty of program flash
;* and this saves the clock cycles required to loop.
;*
renderRow:

    ; 0
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    ; 10

    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    ; 20

    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    ; 30

    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    ; 40

    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    ; 50

    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    HORIZONTAL_PIXEL_MACRO
    ; 55

    ret
