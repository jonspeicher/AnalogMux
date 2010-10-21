// -------------------------------------------------------------------------------------------------
// AnalogMux - TBD
// A project of HackPittsburgh (http://www.hackpittsburgh.org)
//
// Copyright (c) 2010 Jonathan Speicher (jonathan@hackpittsburgh.org)
// Licensed under the MIT license: http://creativecommons.org/licenses/MIT
// -------------------------------------------------------------------------------------------------

#define ANALOG_MUX_CHANNEL_COUNT 16
static int s_analogMuxPinS0, s_analogMuxPinS1, s_analogMuxPinS2, s_analogMuxPinS3;

void initAnalogMux(int pinS0, int pinS1, int pinS2, int pinS3)
{
  s_analogMuxPinS0 = pinS0;
  s_analogMuxPinS1 = pinS1;
  s_analogMuxPinS2 = pinS2;
  s_analogMuxPinS3 = pinS3;
  
  pinMode(s_analogMuxPinS0, OUTPUT);
  pinMode(s_analogMuxPinS1, OUTPUT);
  pinMode(s_analogMuxPinS2, OUTPUT);
  pinMode(s_analogMuxPinS3, OUTPUT);
}

void selectAnalogMuxChannel(unsigned int channel)
{
  digitalWrite(s_analogMuxPinS0, bitRead(channel, 0));
  digitalWrite(s_analogMuxPinS1, bitRead(channel, 1));
  digitalWrite(s_analogMuxPinS2, bitRead(channel, 2));
  digitalWrite(s_analogMuxPinS3, bitRead(channel, 3));
}

// ----

#define ANALOG_MUX_PIN_S0     0
#define ANALOG_MUX_PIN_S1     1
#define ANALOG_MUX_PIN_S2     2
#define ANALOG_MUX_PIN_S3     3
#define ANALOG_MUX_SIGNAL_PIN 0

int currentAnalogMuxChannel = 0;

void setup()
{
  Serial.begin(9600);
  initAnalogMux(ANALOG_MUX_PIN_S0, ANALOG_MUX_PIN_S1, ANALOG_MUX_PIN_S2, ANALOG_MUX_PIN_S3);
}

void loop()
{
  selectAnalogMuxChannel(currentAnalogMuxChannel);
  int analogMuxCounts = analogRead(ANALOG_MUX_SIGNAL_PIN);
  
  Serial.print("Channel: ");
  Serial.print(currentAnalogMuxChannel);
  Serial.print(", Value: ");
  Serial.println(analogMuxCounts);
  
  currentAnalogMuxChannel = (currentAnalogMuxChannel + 1) % ANALOG_MUX_CHANNEL_COUNT;
  delay(1000);
}
