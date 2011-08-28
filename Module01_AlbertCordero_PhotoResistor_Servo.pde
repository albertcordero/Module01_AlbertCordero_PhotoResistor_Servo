// ARCH 1391 - Digital Computation Studio
// Module 01 - Photoresistor & Servo Motor
// Interactive Pavilion Installation
// Albert Cordero

// Code Sourced from CIRC 04 & CIRC 09

// This code will change the intensity of an LED based on the amount of light on the Photo Resistor and allow the Servo to function.

// SERVO - Albert Cordero
// Informing Arduino that Servo Code will be used
#include <Servo.h>
Servo myservo;
int pos = 0;

//Servo Pin - Albert Cordero
int servoPin = 10;

// Demonstrates the analog pin the PhotoResistor is connected to 
int lightPin = 0;

//LED Pin
// Demonstrates where the LED pin is connected
int ledPin = 9;
                  
void setup()
{
  // Sets the LED pin to Output
  pinMode(ledPin, OUTPUT);
  
  // SERVO - Albert Cordero
  myservo.attach(servoPin);
  myservo.write(pos);
  Serial.begin(9600);
}

// This function will commence once setup is concluded and will repeat
void loop()
{
int lightLevel = analogRead(lightPin);
// value 0 to 900 can be adjusted to span 0 to 255
lightLevel = map(lightLevel, 0, 900, 0, 255);

// value must be between 0 and 255
lightLevel = constrain(lightLevel, 0, 255);


// SERVO - Albert Cordero
pos = map(lightLevel, 70, 90, 0, 180);
myservo.write(pos);
Serial.println(lightLevel);

// value will be written
analogWrite(ledPin, lightLevel);
}
