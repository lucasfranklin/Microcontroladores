;****************************************************************************************************
; PRATICA1.ASM
; Prof. Maurílio J. Inácio
; Engenharia de Sistemas
; Unimontes / 2017
;
;****************************************************************************************************
;---------------------------------------------------------------------------------------------------; Configuração do microcontrolador
;---------------------------------------------------------------------------------------------------
	list p=18F4550 ; define o modelo do microcontrolador
	#include <p18f4550.inc> ; inclui um arquivo adicional
	CONFIG WDT= OFF ; desabilita o Watchdog Timer
	CONFIG MCLRE = ON ; define o estado do pino MCLEAR
	CONFIG DEBUG = ON ; habilita o Debug Mode
	CONFIG LVP = OFF ; desabilita o modo Low-Voltage Programming
	CONFIG FOSC = HS ; define o oscilador externo tipo HS
;---------------------------------------------------------------------------------------------------; Definição de rótulos
;---------------------------------------------------------------------------------------------------
;	#define LED PORTD,1 ; rótulo para o Led3
;	#define BOTAO PORTB,4 ; rótulo para o botão Boot
;	#define RELE PORTC,0 ; rótulo para o RELE
;	#define BOTAO1 PORTE,1 ; rótulo para o botão BOTAO 2
;	#define BUZZER PORTC,1 ; rótulo para o BUZZER
;	#define BOTAO2 PORTE,2 ; rótulo para o botão BOTAO 1
	
    VALOR DB 0x00
	#define CHAVE1 PORTA,1 ; ROTULO PARA CHAVE1
	#define CHAVE2 PORTA,2 ; ROTULO PARA CHAVE2
	#define CHAVE3 PORTA,3 ; ROTULO PARA CHAVE3
	#define CHAVE4 PORTA,4 ; ROTULO PARA CHAVE4
	
	#define SEGE PORTB,3 ; ROTULO PARA 
	#define SEGD PORTB,2 ; ROTULO PARA 
	#define SEGG PORTB,1 ; ROTULO PARA 	
	#define SEGC PORTB,0 ; ROTULO PARA 	
	#define SEGF PORTC,7 ; ROTULO PARA 
	#define SEGA PORTC,6 ; ROTULO PARA 
	#define SEGB PORTD,2 ; ROTULO PARA 
;---------------------------------------------------------------------------------------------------; Rotina principal
;---------------------------------------------------------------------------------------------------
	org 0x1000 ; endereço inicial do programa
	clrf PORTB ; limpa a porta B
	clrf PORTD ; limpa a porta D
	clrf PORTC ; 
	clrf PORTA ; 
	
	movlw b'00000000' ; configura os pinos da porta B
	movwf TRISB
	movlw b'00000000' ; configura os pinos da porta D
	movwf TRISD
	movlw b'11111111' ; config 
	movwf TRISA
	movlw b'00000000' ; 
	movwf TRISC
	
	movlw b'00001111'
	movwf ADCON1 
	
	
LOOP
	MOVLW b'00011110'
	ANDWF PORTA, W
	MOVWF VALOR
	
CHAVE_0
	movlw b'00000000'
	CPFSEQ VALOR
	GOTO CHAVE_1
	goto ZERO
CHAVE_1
	movlw b'00010000'
	CPFSEQ VALOR
	GOTO CHAVE_2
	goto UM

CHAVE_2
	movlw b'00001000'
	CPFSEQ VALOR
	GOTO CHAVE_3
	goto DOIS

CHAVE_3
	movlw b'00011000'
	CPFSEQ VALOR
	GOTO CHAVE_4
	goto TRES	

CHAVE_4
	movlw b'00000100'
	CPFSEQ VALOR
	GOTO CHAVE_5
	goto QUATRO

CHAVE_5
	movlw b'00010100'
	CPFSEQ VALOR
	GOTO CHAVE_6
	goto CINCO

CHAVE_6
	movlw b'00001100'
	CPFSEQ VALOR
	GOTO CHAVE_7
	goto SEIS


CHAVE_7
	movlw b'00011100'
	CPFSEQ VALOR
	GOTO CHAVE_8
	goto SETE

CHAVE_8
	movlw b'00000010'
	CPFSEQ VALOR
	GOTO CHAVE_9
	goto OITO

CHAVE_9
	movlw b'00010010'
	CPFSEQ VALOR
	GOTO CHAVE_10
	goto NOVE

CHAVE_10
	movlw b'00001010'
	CPFSEQ VALOR
	GOTO CHAVE_11
	goto AAA

CHAVE_11
	movlw b'00011010'
	CPFSEQ VALOR
	GOTO CHAVE_12
	goto BBB

CHAVE_12
	movlw b'00000110'
	CPFSEQ VALOR
	GOTO CHAVE_13
	goto CCC

CHAVE_13
	movlw b'00010110'
	CPFSEQ VALOR
	GOTO CHAVE_14
	goto DDD

CHAVE_14
	movlw b'00001110'
	CPFSEQ VALOR
	GOTO CHAVE_15
	goto EEE

CHAVE_15
	movlw b'00011110'
	CPFSEQ VALOR
	GOTO LOOP
	goto FFF

	goto LOOP

ZERO
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bcf SEGD
	bcf SEGE
	bcf SEGF
	bsf SEGG
	goto LOOP
	


UM
	bsf SEGA
	bcf SEGB
	bcf SEGC
	bsf SEGD
	bsf SEGE
	bsf SEGF
	bsf SEGG
	goto LOOP

DOIS
	bcf SEGA
	bcf SEGB
	bsf SEGC
	bcf SEGD
	bcf SEGE
	bsf SEGF
	bcf SEGG
	goto LOOP

TRES
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bcf SEGD
	bsf SEGE
	bsf SEGF
	bcf SEGG
	goto LOOP
	
QUATRO
	bsf SEGA
	bcf SEGB
	bcf SEGC
	bsf SEGD
	bsf SEGE
	bcf SEGF
	bcf SEGG
	goto LOOP

CINCO
	bcf SEGA
	bsf SEGB
	bcf SEGC
	bcf SEGD
	bsf SEGE
	bcf SEGF
	bcf SEGG
	goto LOOP

SEIS
	bcf SEGA
	bsf SEGB
	bcf SEGC
	bcf SEGD
	bcf SEGE
	bcf SEGF
	bcf SEGG
	goto LOOP
	
SETE
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bsf SEGD
	bsf SEGE
	bcf SEGF
	bsf SEGG
	goto LOOP
OITO
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bcf SEGD
	bcf SEGE
	bcf SEGF
	bcf SEGG
	goto LOOP
NOVE
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bcf SEGD
	bsf SEGE
	bcf SEGF
	bcf SEGG
	goto LOOP

AAA
	bCf SEGA
	bCf SEGB
	bCf SEGC
	bSf SEGD
	bCf SEGE
	bCf SEGF
	bCf SEGG
	goto LOOP

BBB
	bSf SEGA
	bSf SEGB
	bCf SEGC
	bCf SEGD
	bCf SEGE
	bCf SEGF
	bCf SEGG
	goto LOOP
CCC
	bCf SEGA
	bSf SEGB
	bSf SEGC
	bCf SEGD
	bCf SEGE
	bCf SEGF
	bSf SEGG
	goto LOOP
DDD
	bSf SEGA
	bCf SEGB
	bCf SEGC
	bCf SEGD
	bCf SEGE
	bSf SEGF
	bCf SEGG
	goto LOOP
EEE
	bCf SEGA
	bSf SEGB
	bSf SEGC
	BCf SEGD
	bCf SEGE
	bCf SEGF
	bCf SEGG
	goto LOOP
FFF
	bCf SEGA
	bSf SEGB
	bSf SEGC
	bSf SEGD
	bCf SEGE
	bCf SEGF
	bCf SEGG
	goto LOOP

;LOOP

;	btfsc BOTAO ; verifica o botão
;	goto DESLIGALED ; desvia se o botão não estiver pressionado
;	goto LIGALED
;LOOP1
;	btfsc BOTAO1 ; verifica o botão
;	goto DESLIGARELE
;	goto LIGARELE
;LOOP2	
;	btfsc BOTAO2 ; verifica o botão
;	goto DESLIGABUZZER ; desvia se o botão não estiver pressionado
;	goto LIGABUZINA ; desvia se o botão estiver pressionado
;
;



;Desligando
;DESLIGALED
;	bcf LED ; desliga o led
;	goto LOOP1
;DESLIGARELE	
;	bcf RELE ; DESLIGA RELE
;	goto LOOP2
;DESLIGABUZZER	
;	bsf BUZZER; DESAPITA!
;	goto LOOP
;
;; Ligando
;LIGALED
;	bsf LED ; liga o led
;	goto LOOP1
;LIGARELE
;	bsf RELE ; DESLIGA RELE
;	goto LOOP2
;LIGABUZINA
;	bcf BUZZER ; APITA!
;	goto LOOP
;	
	end