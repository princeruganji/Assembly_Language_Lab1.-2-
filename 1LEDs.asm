
; PIC16F877A Single LED Blink (short delay ~0.25s)
; LED connected to RA0


        LIST    P=16F877A
        #include <p16f877a.inc>

        ORG     0x0000
        GOTO    main


; Main Program


main:
        ; Set PORTA as output
        BSF     STATUS, RP0
        CLRF    TRISA
        BCF     STATUS, RP0

        CLRF    PORTA

blink:
        BSF     PORTA, 0     ; LED ON
        CALL    delay_short

        BCF     PORTA, 0     ; LED OFF
        CALL    delay_short

        GOTO    blink


; Short Delay ? 0.25 second (4 MHz clock)


delay_short:
        MOVLW   d'125'
        MOVWF   0x22

d0:
        MOVLW   d'125'
        MOVWF   0x20

d1:
        MOVLW   d'8'
        MOVWF   0x21

d2:
        DECFSZ  0x21, f
        GOTO    d2

        DECFSZ  0x20, f
        GOTO    d1

        DECFSZ  0x22, f
        GOTO    d0

        RETURN

        END
