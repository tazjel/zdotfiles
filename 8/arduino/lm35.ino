// http://www.labviewarduino.in/2015/05/temperature-indicator-using-lm35.html?m=1

#include<LiquidCrystal.h>
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);
int Tempsensor = A0;


void setup() {
  lcd.begin(16, 2);
  pinMode(5, OUTPUT);
}

void loop() {
  
  float temp = analogRead(Tempsensor);
  temp = temp * 0.48828125; // (5*1000)/1024 = 0.48828125
  delay(100);
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print(" Temperature");
  lcd.setCursor(0, 1);
  lcd.print(temp);
  lcd.print((char)223); // degree symbol for displaying temperature in arduino LCD
  lcd.print("C");
  delay(200);
}
