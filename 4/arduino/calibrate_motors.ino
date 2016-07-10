// Reference:
// https://giantpong.wordpress.com/category/mechanics/

#define UP 1
#define DOWN -1
 
uint8_t lastStep = 0; //So I know which step in the array I should use
const int steps[] = {
  B1001, B1010, B0110, B0101}; // pin layout for each step of driving a stepper motor
const int del = 1000; // delay between steps
 
// Drive the motor COUNT steps in the wanted direction
void Step(long count, int direction) {
  for (long i = 0 ; i < count; ++i) {
    // Get the net step - use as UINT so the modulo works when goign to -1. Won't work if it's the steps count is not a power of 2. 
    lastStep = (uint8_t)(lastStep + direction) %4;
    PORTB = steps[lastStep]; // set the motor pins
    delayMicroseconds(del);  // wait between steps
  }
}
 
// Saves the amount of total steps from side to side
long StepsCount = 0;
 
void Calibrate() {
  // Up calibration. Go up until button is pushed.
  Serial.println("Calibrating UP");
  while (PIND & B00010000) {
    Step(1, UP);
  }
 
  //Down and count!)
  Serial.println("Done. Calibrating Down");
  while (PIND & B00100000) {
    Step(1, DOWN);
    StepsCount++;
  }
 
  Serial.print("Done! StepsCount: ");
  Serial.println(StepsCount);
  // Go to the middle
  Step (StepsCount /2, UP);
 
}
 
void setup() {
  for (int i = 8; i <=11; i++) {
 
    pinMode(i, OUTPUT);
  }
  // Read buttons from pins 4,5 (For calibration)
  pinMode(4, INPUT);
  pinMode(5, INPUT);
 
  // Set internal pullup resistor.
  digitalWrite(4, HIGH);
  digitalWrite(5, HIGH);
 
  PORTB=0;
 
  Serial.begin(9600);
 
  Calibrate();
}
