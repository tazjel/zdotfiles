#include <Servo.h>
Servo arm;
int value = 0;
void setup()
{
arm.attach(9);
Serial.begin(9600);
}
void loop()
{
value = Serial.parseInt();
if (value != 0) {
arm.write(value);
}
}
