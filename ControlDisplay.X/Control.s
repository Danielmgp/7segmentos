PROCESSOR 16F887 
    
    #include <xc.inc>   
    CONFIG FOSC=INTRC_NOCLKOUT 
  
    CONFIG WDTE=OFF
    CONFIG PWRTE=ON
    CONFIG MCLRE=OFF
    CONFIG CP=OFF
    CONFIG CPD=OFF
    CONFIG BOREN=OFF
    CONFIG IESO=OFF
    CONFIG FCMEN=OFF
    CONFIG LVP=OFF
    CONFIG DEBUG=ON
    
    CONFIG BOR4V=BOR40V
    CONFIG WRT=OFF
     
    
    PSECT udata
va1:
    DS 1
cont:
    ds 1
    
PSECT resetVEC,class=CODE, delta=2
resetvec:
    PAGESEL main
    goto main
    
    PSECT code
 m0:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11111100
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m1:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b01100000
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m2:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11011010 
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m3:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11110010 
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m4:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b01100110 
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m5:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b10110110 
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m6:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b10111110 ;encendemos a,c,d,e,f,g
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m7:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11100000 
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m8:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11111110 
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 m9:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    movlw 0b11110110 
    movwf PORTA
    nop
    PAGESEL main
    return
    
    PSECT code
 pausa:
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x20
    nop
    suma:
    incfsz 0x20,f
    goto suma
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x21
    nop
    suma1:
    incfsz 0x21,f
    goto suma1
    bcf STATUS,6
    bcf STATUS,5
    movlw 0b00000001
    movwf 0x22
    nop
    suma2:
    incfsz 0x22,f
    btfss 0x22,3
    goto suma2
    nop
    return
    
    
    PSECT code
    main:
    BANKSEL PORTA 
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    BANKSEL OSCCON
    movlw   0x71    
    movwf   OSCCON
    
    movlw 0b00000000
    movwf PORTA
    nop
    loop:
    PAGESEL m0
    call m0
    call pausa
    call m1
    call pausa
    call m2
    call pausa
    call m3
    call pausa
    call m4
    call pausa
    call m5
    call pausa 
    call m6
    call pausa
    call m7
    call pausa
    call m8
    call pausa
    call m9
    call pausa
   nop
    goto loop
    END