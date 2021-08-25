import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vision_aid/tts_settings.dart';
import 'settings_copy.dart';

class Speech_SynthPage extends StatefulWidget {
  Speech_SynthPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Speech_SynthPageState createState() => _Speech_SynthPageState();
}

enum TtsState { playing, stopped, paused, continued}
class _Speech_SynthPageState extends State<Speech_SynthPage> {
  FlutterTts flutterTts;
  String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print("playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }


  Future _speak() async {
    await flutterTts.setVolume(TTSsettings.newVolume);
    await flutterTts.setSpeechRate(TTSsettings.newRate);
    await flutterTts.setPitch(TTSsettings.newPitch);

    if (_newVoiceText != null) {
      if (_newVoiceText.isNotEmpty) {
        var result = await flutterTts.speak(_newVoiceText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Future _settings() async {
    print(TTSsettings.newVolume);
    print(TTSsettings.language);
    print(TTSsettings.newRate);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  // List<DropdownMenuItem<String>> getEnginesDropDownMenuItems(dynamic engines){
  //   var items = <DropdownMenuItem<String>>[];
  //   for (String type in languages) {
  //     items.add(DropdownMenuItem(value: type, child: Text(type)));
  //   }
  //   return items;
  // }

  void changedLanguageDropDownItem(String selectedType) {
    setState(() {
      TTSsettings.language = selectedType;
      flutterTts.setLanguage(TTSsettings.language);
    });
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            bottomNavigationBar: bottomBar(),
            appBar: AppBar(
              title: Text('Text To Speech',),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  _inputSection(),
                  //TTSsettings.languages != null ? _languageDropDownSection() : Text(""),
                ]))));
  }

  Widget _inputSection() => Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: TextField(
        onChanged: (String value) {
          _onChange(value);
        },
      ));



  Widget _languageDropDownSection() => Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //DropdownButton(
        //value: language,
        //items: getLanguageDropDownMenuItems(language),
        //onChanged: changedLanguageDropDownItem,
        //)
      ]));

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }



  bottomBar() =>Container(
    margin: EdgeInsets.all(10.0),
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: _speak,
          child: Icon(Icons.play_arrow),
          backgroundColor: Colors.green,

        ),

        FloatingActionButton(
          onPressed: _settings,
          backgroundColor: Colors.red,
          child: Icon(Icons.stop),
        ),
      ],
    ),
  );
}
