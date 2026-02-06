
; PIC16F877A Traffic Light System (short delay ~0.25s)
; RA0 = RED, RA1 = YELLOW, RA2 = GREEN


        LIST    P=16F877A
        #include <p16f877a.inc>

        ORG     0x0000
        GOTO    main

main:
        BSF     STATUS, RP0
        CLRF    TRISA
        BCF     STATUS, RP0
        CLRF    PORTA

traffic:
        BSF     PORTA, 0     ; RED ON
        CALL    delay_short
        CLRF    PORTA

        BSF     PORTA, 2     ; GREEN ON
        CALL    delay_short
        CLRF    PORTA

        BSF     PORTA, 1     ; YELLOW ON
        CALL    delay_short
        CLRF    PORTA

        GOTO    traffic


; Short Delay ? 0.25 second (4 MHz)


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


