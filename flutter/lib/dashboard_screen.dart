import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_switches/provider.dart';
import 'constants.dart';
import 'package:firebase_database/firebase_database.dart';

//todo: add provider package
class DashboardScreen extends StatefulWidget {
  static const String id = '/dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<bool> toggles = [false, false, false];
  List<String> rooms = ['Bedroom', 'Hall', 'Bathroom'];
  final SpeechToText speech = SpeechToText();
  final dbRef = FirebaseDatabase.instance.reference();

  List<LocaleName> _localeNames = [];

  String _currentLocaleId = '';

  bool _hasSpeech = false;

  double level = 0.0;

  double minSoundLevel = 50000;

  double maxSoundLevel = -50000;

  String lastWords = '';

  String lastError = '';

  String lastStatus = '';
  int resultListened = 0;
  Future<void> initSpeechState() async {
    var hasSpeech = await speech.initialize(
        onError: errorListener,
        onStatus: statusListener,
        debugLogging: true,
        finalTimeout: Duration(milliseconds: 0));
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale?.localeId ?? '';
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void dbUpdate(int index, var data) {
    if (index == 0) {
      if (data.toggles[index])
        dbRef.child('Light').set({'switch': '0'});
      else
        dbRef.child('Light').set({'switch': '1'});
    } else
      print('These buttons don\'t do anything as of now');
  }

  Widget lightSwitches(int index) {
    return Consumer<ProviderClass>(
      builder: (context, data, _) {
        return GestureDetector(
          onTap: () {
            setState(() {
              data.toggles[index] = !data.toggles[index];
            });
            data.dbUpdate(index);
            // dbUpdate(index, data);
            keepUpdating(data);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: data.toggles[index]
                    ? Text('${rooms[index]} lights are turned on!')
                    : Text('${rooms[index]} lights are turned off!'),
                duration: Duration(milliseconds: 450),
              ),
            );
          },
          child: Padding(
            padding: index.isEven
                ? EdgeInsets.only(left: 15.0, top: 15.0)
                : EdgeInsets.only(right: 15.0, top: 15.0),
            child: DecoratedBox(
              position: DecorationPosition.background,
              decoration: data.toggles[index] == false
                  ? data.themeMode == ThemeMode.light
                      ? neoLightOff.copyWith(
                          color: Theme.of(context).primaryColor)
                      : neoLightOff.copyWith(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff30343a),
                                offset: -Offset(0.0, 0.0),
                                blurRadius: 2.0,
                                spreadRadius: 1.0),
                            BoxShadow(
                              color: Colors.black54.withOpacity(0.1),
                              offset: Offset(4.5, 4.5),
                              blurRadius: 1.0,
                            ),
                          ],
                        )
                  : data.themeMode == ThemeMode.light
                      ? neoLightOn.copyWith(
                          color: Theme.of(context).shadowColor)
                      : neoLightOn.copyWith(boxShadow: [
                          BoxShadow(
                              color: Color(0xff30343A),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 1.0,
                              spreadRadius: -1.0),
                        ]),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.power_settings_new,
                      size: 60.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('${rooms[index]} lights',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> keepUpdating(ProviderClass data) async {
    // Timer.periodic(Duration(seconds: 10), (timer) {
    data.getButtonState();
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSpeechState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffECF0F3),
      floatingActionButton: Consumer<ProviderClass>(
        builder: (context, data, _) => IconButton(
          onPressed: !_hasSpeech || speech.isListening
              ? null
              : () async {
                  startListening();
                  await Future.delayed(Duration(seconds: 5));
                  print('delay complete');
                  if (lastWords.contains('off') &&
                      lastWords.contains('bedroom')) {
                    setState(() {
                      data.toggles[0] = false;
                    });
                    data.dbUpdate(0);
                  }
                  if (lastWords.contains('on') &&
                      lastWords.contains('bedroom')) {
                    setState(() {
                      data.toggles[0] = true;
                    });
                    data.dbUpdate(0);
                  }
                },
          icon: Icon(
            Icons.keyboard_voice,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Smart Switches',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        // backgroundColor: Color(0xffECF0F3),
        elevation: 0.1,
        toolbarHeight: 120.0,
        actions: [
          Consumer<ProviderClass>(
            builder: (context, data, _) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  splashRadius: 25.0,
                  onPressed: () {
                    data.toggleTheme();
                  },
                  icon: Icon(
                    Icons.lightbulb,
                    color: Theme.of(context).accentColor,
                  )),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Consumer<ProviderClass>(
            builder: (context, data, _) => RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: () {
                return Future.delayed(Duration(milliseconds: 200), () {
                  print('refreshed');
                  data.getButtonState();
                });
              },
              child: CustomScrollView(
                slivers: [
                  // SliverAppBar(
                  //   title: Text('Smart Switches'),
                  //   centerTitle: true,
                  // ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final buttons = lightSwitches(index);
                        return buttons;
                      },
                      childCount: 3,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                        childAspectRatio: 1.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void startListening() {
    lastWords = '';
    lastError = '';
    setState(() {
      speech.listen(
          onResult: resultListener,
          listenFor: Duration(seconds: 30),
          pauseFor: Duration(seconds: 5),
          partialResults: true,
          localeId: _currentLocaleId,
          onSoundLevelChange: soundLevelListener,
          cancelOnError: true,
          listenMode: ListenMode.confirmation);
    });
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    ++resultListened;
    print('Result listener $resultListened');
    setState(() {
      lastWords = '${result.recognizedWords} '; //- ${result.finalResult}
      print(lastWords);
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    // print(
    // 'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = '$status';
    });
  }

  void _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }
}
