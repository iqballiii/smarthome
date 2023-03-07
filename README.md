# smarthome_ide
A simple arduino project. This project is a beginner's guide to making a smart home. I have been working around combining flutter and arduino to give a complete control of what you can make rather than using a third party application. 

![image](https://user-images.githubusercontent.com/67243536/223365217-0818716a-50c8-45e7-98d3-699dbedf3643.png)

This is a personal-use case project that I have develpoed using flutter. This application has been integrated with firebase database package to access firebase realtime DB, to control a light bulb using an ESP module. The esp module code can be found on this link ___________. Along with that the appplication's UI is of neumorphism style. I have just started to explore neumorphism style with this applcation. Stay tuned for more...

All that is related to the front-end part. Now, coming to the backend and the hardware used:

ESP 8266 module
- A 5v relay module
- Arduino uno (as an intermediary for connecting the ESP module)
- Light bulb
- Power source

=============================================== 

Project Details
Circuit connection/diagram

 ![image](https://user-images.githubusercontent.com/67243536/223366784-1c85467b-705c-4ccc-952b-ba1ddaf3918d.png)

Project setup 
1. Create a new Flutter project on any IDE (preferred: Android Studio or Visual Studio Code. )

The firebase set up is quite easy with flutter because of the easy-to-integrate packages available at https://pub.dev/

2. Before setting up firebase on your flutter app you will have to setup a firebase project side-by-side on the Firebase Cloud Console.

3. And finally, create an arduino code on your Arduino IDE along with the required firebase libraries. 
(P.S. - I faced trouble in troubleshooting the RSA key that is defined in the firebase library. So, try to update the Key if it not using the latest value.)

After finishing with all the setup. Configure the wifi connection on your arduino device through the arduino IDE. 

Thank you
Happy Learning and Fluttering
