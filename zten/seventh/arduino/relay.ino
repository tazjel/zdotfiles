#define CW 8 //CW is defined as pin #7//

#define CCW 9 //CCW is defined as pin #8//

#define CW2 10 //CW is defined as pin #7//

#define CCW2 11 //CCW is defined as pin #8//

void setup() { //Setup runs once//

pinMode(CW, OUTPUT); //Set CW as an output//

pinMode(CCW, OUTPUT); //Set CCW as an output//

pinMode(CW2, OUTPUT); //Set CCW as an output//

pinMode(CCW2, OUTPUT); //Set CCW as an output//

}

void loop() { //Loop runs forever//

digitalWrite(CW,HIGH); //Motor runs clockwise//
digitalWrite(CW2,HIGH); //Motor runs clockwise//


delay(1000); //for 1 second//

digitalWrite(CW, LOW); //Motor stops//
digitalWrite(CW2, LOW); //Motor stops//

digitalWrite(CCW, HIGH);//Motor runs counter-clockwise//
digitalWrite(CCW2, HIGH);//Motor runs counter-clockwise//

delay(1000); //For 1 second//

digitalWrite(CCW, LOW); //Motor stops//
digitalWrite(CCW2, LOW); //Motor stops//

}
