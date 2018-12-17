;****************************************************************************************************
; PRATICA2.ASM
; Prof. Maurílio J. Inácio
; Engenharia de Sistemas
; Unimontes / 2016
;
;****************************************************************************************************
;---------------------------------------------------------------------------------------------------
; Configuração do microcontrolador
;---------------------------------------------------------------------------------------------------
list p=18F4550 ; define o modelo do microcontrolador
#include <p18f4550.inc> ; inclui um arquivo adicional
CONFIG WDT=OFF ; desabilita o Watchdog Timer
CONFIG MCLRE = ON ; define o estado do pino MCLEAR
CONFIG DEBUG = ON ; habilita o Debug Mode
CONFIG LVP = OFF ; desabilita o modo Low-Voltage Programming
CONFIG FOSC = HS ; define o oscilador externo tipo HS
;---------------------------------------------------------------------------------------------------
; Definição de rótulos
;---------------------------------------------------------------------------------------------------
#define BOTAO1 PORTE,1 ; rótulo para o botão 1
#define BOTAO2 PORTE,2 ; rótulo para o botão 2

#define SEGE PORTB,3 ; ROTULO PARA 
#define SEGD PORTB,2 ; ROTULO PARA 
#define SEGG PORTB,1 ; ROTULO PARA 	
#define SEGC PORTB,0 ; ROTULO PARA 	
#define SEGF PORTC,7 ; ROTULO PARA 
#define SEGA PORTC,6 ; ROTULO PARA 
#define SEGB PORTD,2 ; ROTULO PARA 

#define SEG2E PORTB,7 ; ROTULO PARA 
#define SEG2D PORTB,6 ; ROTULO PARA 
#define SEG2G PORTD,6 ; ROTULO PARA 	
#define SEG2C PORTB,5 ; ROTULO PARA 	
#define SEG2F PORTD,7 ; ROTULO PARA 
#define SEG2A PORTD,5 ; ROTULO PARA 
#define SEG2B PORTD,4 ; ROTULO PARA 

;---------------------------------------------------------------------------------------------------
; Declaração de variáveis
;---------------------------------------------------------------------------------------------------
delay_val db 0x00 ; variável auxiliar
delay_x50 db 0x00 ; variável auxiliar
delay_x200 db 0x00 ; variável auxiliar
;---------------------------------------------------------------------------------------------------
; Rotina principal
;---------------------------------------------------------------------------------------------------
org 0x1000 ; endereço inicial do programa

clrf PORTC ; limpa a porta C
clrf PORTE ; limpa a porta E
clrf PORTB ; limpa a porta B
clrf PORTD ; limpa a porta D
clrf PORTA ; 
	
movlw b'00000000' ; configura os pinos da porta B
movwf TRISB
movlw b'00000000' ; configura os pinos da porta D
movwf TRISD
movlw b'00000000' ; config 
movwf TRISA
movlw b'00000000' ; configura os pinos da porta C
movwf TRISC
movlw b'00001111' ; configura os pinos da porta B
movwf TRISE

movlw b'00001111'
movwf ADCON1 


INICIAR
btfsc BOTAO1 ; verifica o botão
goto INICIO ; desvia se o botão não estiver pressionado
goto INICIAR ; desvia se o botão estiver pressionado

PAUSE
btfsc BOTAO1 ; verifica o botão
return
GOTO PAUSE


CHECK
btfsc BOTAO1 ; verifica o botão
GOTO PAUSE
return



INICIO
call ZERO_2
call DEZENAS

call UM_2
call DEZENAS

call DOIS_2
call DEZENAS

call TRES_2
call DEZENAS

call QUATRO_2
call DEZENAS

call CINCO_2
call DEZENAS

call SEIS_2
call DEZENAS

call SETE_2
call DEZENAS

call OITO_2
call DEZENAS

call NOVE_2
call DEZENAS

GOTO INICIO
;	bcf BUZZER ; desliga o buzzer

;VERIFICA_BOTAO1
	;btfss BOTAO1 ; verifica se botão1 está pressionado
;	goto ZERO; desvia para VERIFICA_BOTAO2 se não estiver pressionado	
	;bsf BUZZER ; liga o buzzer


;	bcf BUZZER ; desliga o buzzer
;	movlw 0x32 ; carrega W com o delay desejado (0,5s)
;	call DELAY ; chama a sub-rotina DELAY
;	goto INICIO ; desvia para o início do programa

;VERIFICA_BOTAO2
;	btfss BOTAO2 ; verifica se o botão2 está pressionado
;	goto INICIO ; desvia para INICIO se não estiver pressionado
;	bsf BUZZER ; liga o buzzer
;	movlw 0xC8 ; carrega W com o delay desejado (2s)
;	call DELAY ; chama a sub-rotina DELAY
;	bcf BUZZER ; desliga o buzzer
;	movlw 0xC8 ; carrega W com o delay desejado (2s)
;	call DELAY ; chama a sub-rotina DELAY
;	goto INICIO ; desvia para o início do programa

DEZENAS
	 call ZERO
	 call UM_SEC_DELAY
	 call UM
	 call UM_SEC_DELAY
	 call DOIS
	 call UM_SEC_DELAY
	 call TRES
	 call UM_SEC_DELAY
	 call QUATRO
	 call UM_SEC_DELAY
	 call CINCO
	 call UM_SEC_DELAY
	 call SEIS
	 call UM_SEC_DELAY
	 call SETE
	 call UM_SEC_DELAY
	 call OITO
	 call UM_SEC_DELAY
	 call NOVE
	 call UM_SEC_DELAY

ZERO_2
	bcf SEG2A
	bcf SEG2B
	bcf SEG2C
	bcf SEG2D
	bcf SEG2E
	bcf SEG2F
	bsf SEG2G
	call CHECK
	return
	
UM_2
	bsf SEG2A
	bcf SEG2B
	bcf SEG2C
	bsf SEG2D
	bsf SEG2E
	bsf SEG2F
	bsf SEG2G
	call CHECK
	return

DOIS_2
	bcf SEG2A
	bcf SEG2B
	bsf SEG2C
	bcf SEG2D
	bcf SEG2E
	bsf SEG2F
	bcf SEG2G
	call CHECK
	return

TRES_2
	bcf SEG2A
	bcf SEG2B
	bcf SEG2C
	bcf SEG2D
	bsf SEG2E
	bsf SEG2F
	bcf SEG2G
	call CHECK
	return
	
QUATRO_2
	bsf SEG2A
	bcf SEG2B
	bcf SEG2C
	bsf SEG2D
	bsf SEG2E
	bcf SEG2F
	bcf SEG2G
	call CHECK
	return

CINCO_2
	bcf SEG2A
	bsf SEG2B
	bcf SEG2C
	bcf SEG2D
	bsf SEG2E
	bcf SEG2F
	bcf SEG2G
	call CHECK
	return

SEIS_2
	bcf SEG2A
	bsf SEG2B
	bcf SEG2C
	bcf SEG2D
	bcf SEG2E
	bcf SEG2F
	bcf SEG2G
	call CHECK
	return
	
SETE_2
	bcf SEG2A
	bcf SEG2B
	bcf SEG2C
	bsf SEG2D
	bsf SEG2E
	bcf SEG2F
	bsf SEG2G
	call CHECK
	return

OITO_2
	bcf SEG2A
	bcf SEG2B
	bcf SEG2C
	bcf SEG2D
	bcf SEG2E
	bcf SEG2F
	bcf SEG2G
	call CHECK
	return

NOVE_2
	bcf SEG2A
	bcf SEG2B
	bcf SEG2C
	bcf SEG2D
	bsf SEG2E
	bcf SEG2F
	bcf SEG2G
	call CHECK
	return

ZERO
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bcf SEGD
	bcf SEGE
	bcf SEGF
	bsf SEGG
	call CHECK
	return
	
UM
	bsf SEGA
	bcf SEGB
	bcf SEGC
	bsf SEGD
	bsf SEGE
	bsf SEGF
	bsf SEGG
	call CHECK
	return

DOIS
	bcf SEGA
	bcf SEGB
	bsf SEGC
	bcf SEGD
	bcf SEGE
	bsf SEGF
	bcf SEGG
	call CHECK
	return

TRES
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bcf SEGD
	bsf SEGE
	bsf SEGF
	bcf SEGG
	call CHECK
	return
	
QUATRO
	bsf SEGA
	bcf SEGB
	bcf SEGC
	bsf SEGD
	bsf SEGE
	bcf SEGF
	bcf SEGG
	call CHECK
	return

CINCO
	bcf SEGA
	bsf SEGB
	bcf SEGC
	bcf SEGD
	bsf SEGE
	bcf SEGF
	bcf SEGG
	call CHECK
	return

SEIS
	bcf SEGA
	bsf SEGB
	bcf SEGC
	bcf SEGD
	bcf SEGE
	bcf SEGF
	bcf SEGG
	call CHECK
	return
	
SETE
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bsf SEGD
	bsf SEGE
	bcf SEGF
	bsf SEGG
	call CHECK
	return

OITO
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bcf SEGD
	bcf SEGE
	bcf SEGF
	bcf SEGG
	call CHECK
	return

NOVE
	bcf SEGA
	bcf SEGB
	bcf SEGC
	bcf SEGD
	bsf SEGE
	bcf SEGF
	bcf SEGG
	call CHECK
	return
;---------------------------------------------------------------------------------------------------
; Sub-rotina DELAY
; Gera um delay entre 10ms e 2,55s aproximadamente
; O valor do delay é passado pelo registrador W (1 a 255)
; A base de tempo da sub-rotina é 0,2 us (período do clock de 20MHz/4)
;---------------------------------------------------------------------------------------------------
UM_SEC_DELAY
	movlw 0x64 ; carrega W com o delay desejado (0,5s)
	call DELAY ; chama a sub-rotina DELAY
	return

DELAY
	movwf delay_val ; carrega o valor do delay desejado
Del_10ms ; delay de 10 mS
	movlw 0x32 ; fator de multiplicação por 50
	movwf delay_x50 ; variável auxiliar
Del_200us ; delay de 200 us
	movlw 0xC8 ; fator de multiplicação por 200
	movwf delay_x200 ; variável auxiliar

Loop ; início do loop
	nop ; não faz nada
	nop ; não faz nada
	decfsz delay_x200,f ; decrementa delay_x200 e desvia se for 0
	goto Loop ; se não for zero, desvia para Loop
	decfsz delay_x50,f ; decrementa delay_x50 e desvia se for 0
	goto Del_200us ; se não for zero, desvia para Del_200us
	decfsz delay_val,f ; decrementa delay_val e desvia se for 0
	goto Del_10ms ; se não for zero, desvia para Del_10ms
	return ; retorno da sub-rotina

end
