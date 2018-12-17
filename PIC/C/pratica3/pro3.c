//--------------------------------------------------------------------------------
// Arquivos de cabe�alho
//--------------------------------------------------------------------------------
#include <p18cxxx.h> // inclui um arquivo cabe�alho ref. ao microcontrolador
#include "my_xlcd.h" // inclui um arquivo cabe�alho ref. ao display LCD
//--------------------------------------------------------------------------------
// Configura��o do microcontrolador
//--------------------------------------------------------------------------------
#pragma config WDT=OFF // desabilita o Watchdog Timer
#pragma config MCLRE = ON // define o estado do pino MCLEAR
#pragma config DEBUG = ON // habilita o Debug Mode
#pragma config LVP = OFF // desabilita o modo Low-Voltage Programming
#pragma config FOSC = HS // define o oscilador externo tipo HS
//********************************************************************************
// VECTOR REMAPPING
//********************************************************************************
// Rotina necess�ria para todo projeto que utilize o bootloader no PIC.
extern void _startup (void);
#pragma code REMAPPED_RESET_VECTOR = 0x001000
void _reset (void)
{
_asm goto _startup _endasm
}
#pragma code
//--------------------------------------------------------------------------------
// Defini��o de r�tulos
//--------------------------------------------------------------------------------
#define BOOT PORTBbits.RB4
#define BOTAO1 PORTEbits.RE1
#define BOTAO2 PORTEbits.RE2
#define LEDVERDE PORTCbits.RC2
#define BUZZER PORTCbits.RC1
#define RELE PORTCbits.RC0
//--------------------------------------------------------------------------------
// Fun��o principal
//--------------------------------------------------------------------------------
void main(void)
{
// Configura��o das portas
TRISB = 0xFF; // configura todos pinos da porta B como entrada
TRISC = 0x00; // configura todos pinos da porta C como sa�da
ADCON1 |= 0x0F; // desabilita as entradas anal�gicas
// Configura��o dos pinos que s�o usados pelo LCD
OpenXLCD();
// Desativa os dispositivos
LEDVERDE = 0;
BUZZER = 0;
RELE = 0;
// Seleciona a linha 1 do display LCD
SetDDRamAddr(0x00);
// Escreve a string no display LCD
putrsXLCD(" SISTEMAS ");
// Seleciona a linha 2 do display LCD
SetDDRamAddr(0x40);
// Escreve a string no display LCD
putrsXLCD("MICROPROCESSADOS");
// Loop
while(1)
{
if (BOOT == 0) { // verifica se o bot�o BOOT est� pressionado
LEDVERDE = !LEDVERDE; // inverte o estado do LED VERDE
if (LEDVERDE == 1) {
SetDDRamAddr(0x00);
putrsXLCD("LED VERDE ");
SetDDRamAddr(0x40);
putrsXLCD("ATIVADO ");
} else {
SetDDRamAddr(0x00);
putrsXLCD("LED VERDE ");
SetDDRamAddr(0x40);
putrsXLCD("DESATIVADO ");
}
}
if (BOTAO1 == 1) { // verifica se o bot�o BOTAO1 est� pressionado
BUZZER = !BUZZER; // inverte o estado do BUZZER
if (BUZZER == 1) {
SetDDRamAddr(0x00);
putrsXLCD("BUZZER ");
SetDDRamAddr(0x40);
putrsXLCD("ATIVADO ");
} else {
SetDDRamAddr(0x00);
putrsXLCD("BUZZER ");
SetDDRamAddr(0x40);
putrsXLCD("DESATIVADO ");
}
}
if (BOTAO2 == 1) { // verifica se o bot�o BOTAO2 est� pressionado
RELE = !RELE; // inverte o estado do RELE
if (RELE == 1) {
SetDDRamAddr(0x00);
putrsXLCD("RELE ");
SetDDRamAddr(0x40);
putrsXLCD("ATIVADO ");
} else {
SetDDRamAddr(0x00);
putrsXLCD("RELE ");
SetDDRamAddr(0x40);
putrsXLCD("DESATIVADO ");
}
}
}
}