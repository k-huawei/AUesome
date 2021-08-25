import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'profile.dart';
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

  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) =>
              setState(() {
                _text = val.recognizedWords;
                print(_text);
                //if (val.hasConfidenceRating && val.confidence > 0) {
                //_confidence = val.confidence;
                //}
                // if (_text == "open object detector" || _text == "open object recognition" || _text == "object detection" || _text == "object recognizer" ||_text == "detect objects"|| _text == "recognize objects"){
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => HomePage(cameras))
                //   );
                // }
                // if (_text == "open letter recognition"){
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => LetterRecognitionPage(title: "Letter Recognition"))
                //   );
                // }
                // if (_text == "open settings"){
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => SettingPage(title: "Settings"))
                //   );
                //};
                // if (_text == "Mute??"){
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => LetterRecognitionPage(title: "Letter Recognition"))
                //   );
                // }
              }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void initState() {
    super.initState();
    stt.SpeechToText _speech = stt.SpeechToText();
    _speech = stt.SpeechToText();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex:25,
                child: Container (
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    child: const Text('KH'),
                  ),
                  title: Text("Profile"),
                  subtitle: Text("Kathy"),
                  onTap:  () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage())
                  ),
                  trailing:  Icon(
                       Icons.arrow_forward_ios_rounded,
                        size: 24.0,
                        color: Colors.black54,
                    ),

                ),
            )
          ),
            Expanded(
                flex:25,
                child: Container (
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown.shade800,
                      child: const Text('AH'),
                    ),
                    //title: Text("Profile"),
                    //subtitle: "Kathy",
                    onTap:  () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage())
                      );
                    },
                    trailing:  Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.0,
                      color: Colors.black54,
                    ),

                  ),
                )
            ),
            Expanded(
              flex: 20,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.deepPurpleAccent),
                    ),
                    onPressed: () {
                      _listen();

                      //Navigator.push(
                      //  context,
                      //MaterialPageRoute(builder: (context) => SpeechRecognitionPage(title:'Speech Recognition'))
                      //);
                    },
                    child: Text(
                      'Speech Recognition',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),)
                ),
              ),
            ),

          ],

        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



