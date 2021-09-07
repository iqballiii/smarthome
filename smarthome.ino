#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <SoftwareSerial.h>
#include <FirebaseArduino.h>

//const char* ssid = "HD LINK"; //Enter SSID
//const char* password = "qwerty#@!"; 
const char* ssid = "net1107"; //Enter SSID
const char* password = "password123"; 
const char* FIREBASE_HOST  = "smart-switches-e6c1d-default-rtdb.firebaseio.com"; 
const char* FIREBASE_AUTH = "l4XKbwNSTYN7RWfi75uB18kYac3invCQKRD2XxG9"; 
//#define WIFI_SSID "net1107"
//#define WIFI_PASSWORD "password123"
//#define FIREBASE_HOST "https://smart-switches-e6c1d-default-rtdb.firebaseio.com/"
//#define FIREBASE_AUTH "l4XKbwNSTYN7RWfi75uB18kYac3invCQKRD2XxG9"
int LED = 0;
String light;          //bool, which will store the value from the data base and check 
// if the output is supposed to be "ON" or "OFF".

void setup()
{
pinMode(LED, OUTPUT); //setting output pin at GPIO 1 
Serial.begin(115200);
delay(500);
Serial.println("\n"); 
Serial.println("connecting"); 
WiFi.begin(ssid, password);
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
  light = Firebase.getString("/Light/switch");
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
