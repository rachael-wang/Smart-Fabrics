
const int analogInPin_1 = A11;  // Analog input pin that the potentiometer is attached to
const int analogInPin_2 = A9;
const int analogInPin_3 = A7;
const int analogInPin_4 = A10;

int sensorValue_1 = 0;        // value read from the pot
int outputValue_1 = 0;        // value output to the PWM (analog out)

int sensorValue_2 = 0;        // value read from the pot
int outputValue_2 = 0;        // value output to the PWM (analog out)

int sensorValue_3 = 0;        // value read from the pot
int outputValue_3 = 0;        // value output to the PWM (analog out)

int sensorValue_4 = 0;        // value read from the pot
int outputValue_4 = 0;        // value output to the PWM (analog out)

void setup() {
	// initialize serial communications at 9600 bps:
	Serial.begin(9600);
}

void loop() {
	// read the analog in value:
	sensorValue_1 = analogRead(analogInPin_1);
	// map it to the range of the analog out:
	outputValue_1 = map(sensorValue_1, 0, 1023, 0, 255);

	// read the analog in value:
	sensorValue_2 = analogRead(analogInPin_2);
	// map it to the range of the analog out:
	outputValue_2 = map(sensorValue_2, 0, 1023, 0, 255);

	// read the analog in value:
	sensorValue_3 = analogRead(analogInPin_3);
	// map it to the range of the analog out:
	outputValue_3 = map(sensorValue_3, 0, 1023, 0, 255);

	// read the analog in value:
	sensorValue_4 = analogRead(analogInPin_4);
	// map it to the range of the analog out:
	outputValue_4 = map(sensorValue_4, 0, 1023, 0, 255);

//	// print the results to the Serial Monitor:

  Serial.print(outputValue_1);
  Serial.println("a");

  Serial.print(outputValue_2);
  Serial.println("b");

  Serial.print(outputValue_3);
  Serial.println("c");

  Serial.print(outputValue_4);
  Serial.println("d");


  // int a = analogRead(A11);
  // char buffer_tmp[2];
  // buffer_tmp[0] = a >> 6 + offset;
  // buffer_tmp[1] = a & 0xFF00 + offset; //offset = 128
  // Serial.write(buffer_tmp,2);
  // Serial.write(10);

	// Serial.print(outputValue_2);
	// Serial.println(" s2");

	// wait 2 milliseconds before the next loop for the analog-to-digital
	// converter to settle after the last reading:
	delay(20);
}
