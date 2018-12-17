//--------------------------------------------------------------------------------
// Arquivos de cabe�alho
//--------------------------------------------------------------------------------
#include <p18cxxx.h>	// inclui um arquivo cabe�alho ref. ao microcontrolador
#include <stdio.h>		// inclui um arquivo cabe�alho ref. �s fun��es de string
#include <adc.h>		// inclui um arquivo cabe�alho ref. ao conversor AD
#include "my_xlcd.h"	// inclui um arquivo cabe�alho ref. ao display LCD

//--------------------------------------------------------------------------------
// Configura��o do microcontrolador
//--------------------------------------------------------------------------------
#pragma config WDT = OFF		// desabilita o Watchdog Timer
#pragma config MCLRE = ON		// define o estado do pino MCLEAR
#pragma config DEBUG = ON		// habilita o Debug Mode
#pragma config LVP = OFF		// desabilita o modo Low-Voltage Programming
#pragma config FOSC = INTOSC_HS	// define o oscilador interno (48MHz)
#pragma config XINST = OFF  	// desabilita o Extended CPU Mode


//--------------------------------------------------------------------------------
// Defini��o de r�tulos
//--------------------------------------------------------------------------------	 
#define VDD 5		
#define resolucao VDD/1023.0

#define BOTAO1 PORTEbits.RE1
#define BOTAO2 PORTEbits.RE2
#define RELE PORTCbits.RC0
#define BUZZ PORTCbits.RC1
#define LEDR PORTDbits.RD1
#define saidaPWM PORTCbits.RC2
//--------------------------------------------------------------------------------
// Vari�veis globais
//--------------------------------------------------------------------------------


//********************************************************************************
//  VECTOR REMAPPING
//********************************************************************************
// Rotina necess�ria para todo projeto que utilize o BOOTLOADER no PIC.
extern void _startup (void);
#pragma code REMAPPED_RESET_VECTOR = 0x001000
void _reset (void)
{
    _asm goto _startup _endasm
}
#pragma code


//--------------------------------------------------------------------------------
// Fun��o principal
//--------------------------------------------------------------------------------
void main(void)
{	
	// Declara��o de vari�veis
	char str[17];
	int i, valorDigital;
	float valorAnalog;
	int j=600;
	
	int alarme=26;
	// Configura��o das portas
	TRISA = 0xFF;		// configura todos pinos da porta A como entrada
	TRISD = 0x00;		// configura todos pinos da porta D como sa�da
	TRISE = 0xFF;		// configura todos pinos da porta E como entrada
	TRISC = 0x00;
	//Configura��o do conversor AD
	OpenADC(
			ADC_FOSC_64 &		// define a fonte de clock para o conversor A/D
			ADC_RIGHT_JUST & 	// define o modo de justifica��o
			ADC_2_TAD, 			// define o tempo de aquisi��o
			ADC_CH5 & 			// define o canal anal�gico
			ADC_INT_OFF & 		// desabilita a interrup��o do conversor A/D
			ADC_REF_VDD_VSS,	// define a fonte de tens�o de refer�ncia
			ADC_8ANA );			// define a configura��o dos canais anal�gicos


	OpenXLCD();	 // inicializa o LCD
	BUZZ=0;
	RELE=0;
	LEDR=0;
	// Exibe mensagem inicial
	SetDDRamAddr(0x00);
	putrsXLCD("  Conversao A/D ");
	SetDDRamAddr(0x40);
	putrsXLCD("  Temperatura ");

	// Aguarda ~ 1s
	for(i = 0; i < 10; i++)
	{
		Delay10KTCYx(120);
	}

	// Apaga mensagem inicial
	SetDDRamAddr(0x00);
	putrsXLCD("                ");
	SetDDRamAddr(0x40);
	putrsXLCD("                ");
	
    for(;;)
   { 
	

		ConvertADC();						// inicia o processo de  convers�o
		while(BusyADC());					// aguarda o t�rmino da convers�o
		valorDigital =  ReadADC();	// l� o valor convertido
		valorAnalog = valorDigital/5.76 ;	// valor convertido para tens�o
		
		LEDR=1;
		Delay10TCYx(valorDigital/6);
		LEDR=0;
		Delay10TCYx(5000-valorDigital/8);
		
	}//end for
}//end main

