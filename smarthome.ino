#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <SoftwareSerial.h>
#include <FirebaseArduino.h>


const char* ssid = ""; //Enter SSID
const char* password = ""; //enter your wifi password 
const char* FIREBASE_HOST  = ".firebaseio.com"; //enter your firebase database url
const char* FIREBASE_AUTH = ""; //enter your secret key associated to the firebase account

int LED = 0;
String light;    //This variable will store the value from the data base and check 
                 // if the output is supposed to be "ON" or "OFF".

void setup()
{
pinMode(LED, OUTPUT); //setting output pin at GPIO 1 
Serial.begin(115200);
delay(500);
Serial.println("\n"); 
Serial.println("connecting"); 
WiFi.begin(ssid, password);    //this function from the wifi library is used to setup your device to the 
                               //internet.
while(WiFi.status() != WL_CONNECTED)
{
  Serial.print(".");
  delay(500);
  }
  Serial.println();
  Serial.print("connected");
  WiFi.setSleepMode(WIFI_NONE_SLEEP);
  Serial.println(WiFi.localIP());
Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
if (Firebase.failed()) { 
      Serial.print("firebase begin failed:"); 
      Serial.println(Firebase.error());   
      return; 
  }
Serial.print("setup is complete");
delay(1000);
}

void loop()
{  
  light = Firebase.getString("/Light/switch1");
 //  handle error 
  if (Firebase.failed()) { 
      Serial.print("LIGHT switch failed:"); 
      Serial.println({Firebase.error()});   
      return; 
  }

  Serial.println(light); 
  if(light == "1"){
    Serial.println("the light is ONN");
    digitalWrite(LED,HIGH);
    }
   else{
    Serial.println("the light is OFF");
    Serial.println(light);
    digitalWrite(LED,LOW);
      }
Serial.println("loop ended");
delay(500);

}
