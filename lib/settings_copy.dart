import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'tts_settings.dart';
class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);

  //GOALS
  // 1. Audio Settings (for Text to Speech): volume, pitch, male/female, language
  //

  final String title;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  FlutterTts flutterTts;
  dynamic languages;
  String language;
  // double volume = 0.5;
  // double pitch = 1.0;
  // double rate = 0.5;


  @override
  initState() {
    super.initState();
    _getLanguages();
  }



  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    print("print ${languages}");
    if (languages != null) setState(() => languages);
  }


  List<DropdownMenuItem<String>> getEnginesDropDownMenuItems(dynamic engines) {
    var items = <DropdownMenuItem<String>>[];
    for (String type in languages) {
      items.add(DropdownMenuItem(value: type, child: Text(type)));
    }
    return items;
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          //bottomNavigationBar: bottomBar(),
            appBar: AppBar(
              title: Text('Text To Speech',),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  languages != null ? _languageDropDownSection() : Text(""),
                  _buildSliders()
                ]))));
  }


  Widget _languageDropDownSection() =>
      Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            DropdownButton(
              //value: language,
              //items: getLanguageDropDownMenuItems(language),
              //onChanged: changedLanguageDropDownItem,
            )
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

  Widget _buildSliders() {
    return Column(
      children: [_volume(), _pitch(), _rate()],
    );
  }

  Widget _volume() {
    return Slider(
        value: TTSsettings.newVolume,
        onChanged: (newVolume) {
          setState(() => TTSsettings.newVolume = newVolume);
        },
        min: 0.0,
        max: 1.0,
        divisions: 10,
        label: "Volume: $TTSsettings.newVolume");
  }

  Widget _pitch() {
    return Slider(
      value: TTSsettings.newPitch,
      onChanged: (newPitch) {
        setState(() => TTSsettings.newPitch = newPitch);
      },
      min: 0.5,
      max: 2.0,
      divisions: 15,
      label: "Pitch: $TTSsettings.newPitch,",
      activeColor: Colors.red,
    );
  }

  Widget _rate() {
    return Slider(
      value: TTSsettings.newRate,
      onChanged: (newRate) {
        setState(() => TTSsettings.newRate = newRate);
      },
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Rate: $TTSsettings.newRate",
      activeColor: Colors.green,
    );
  }

// bottomBar() =>Container(
//   margin: EdgeInsets.all(10.0),
//   height: 50,
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: <Widget>[
//       FloatingActionButton(
//         onPressed: _speak,
//         child: Icon(Icons.play_arrow),
//         backgroundColor: Colors.green,
//
//       ),
//
//       FloatingActionButton(
//         onPressed: _stop,
//         backgroundColor: Colors.red,
//         child: Icon(Icons.stop),
//       ),
//     ],
//   ),
// );
}