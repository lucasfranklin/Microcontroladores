//Programa: Teste de Display LCD 16 x 2
//Autor: FILIPEFLOP

//Carrega a biblioteca LiquidCrystal
#include <LiquidCrystal.h>

//Define os pinos que serão utilizados para ligação ao display
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
int inPin = 9;
int inPin2 = 8;
int count = 0;
int val, val2;

//LM35
float tempC;
int tempMed;
int temperatura;
int tempPin = A8;

//Time
int h=0; 
int m; 
int s; 

//*******************

void setup()
{
  Serial.begin(9600);
  pinMode(inPin, INPUT);    // declare pushbutton as input
  pinMode(tempPin, INPUT);  
  pinMode(inPin2, INPUT);    // declare pushbutton as input
  //Define o número de colunas e linhas do LCD
  lcd.begin(16, 2);
}

void loop()
{

  val = digitalRead(inPin);  // read input value
  if (val == LOW) {         // check if the input is HIGH (button released)
    m = m + 1;  // turn LED OFF]
    Serial.println(count);
  }

    val2 = digitalRead(inPin2);  // read input value
  if (val2 == LOW) {         // check if the input is HIGH (button released)
    h = h + 1;  // turn LED OFF]
    Serial.println(count);
  }

lcd.setCursor(0,0); 
s=s+1; 

delay(1000); 

lcd.clear(); 

if(s==60){ 
 s=0; 
 m=m+1; 
} 
if(m==60) 
{ 
 m=0; 
 h=h+1; 
} 

if(h==24) 
{ 
 h=0; 
} 

//LM35
  tempC = leitura_LM35();
  Serial.println(tempC);
  //delay(1000);

 //LCD
  lcd.setCursor(0, 0);
  lcd.print("Hora:");lcd.print(h, 10);
  lcd.print(":"); lcd.print(m, 10);
  lcd.print(":");lcd.print(s, 10);
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 1);
  lcd.print("Temp:");lcd.print(tempC, 10);
  // print the number of seconds since reset:
}


double leitura_LM35(){
  tempMed=0;
  int i;
  int amostragem = 10;
  //Amostragem da temperatura média de 1000 amostragens
  for(i=0; i<amostragem; i++){
    //Conversão do sinal do LM35 para graus Celsius
    temperatura = (float(analogRead(tempPin))*5/(1023))/0.01;
    tempMed = tempMed + temperatura;
  }
  tempMed = tempMed/amostragem;
  return tempMed;
}
