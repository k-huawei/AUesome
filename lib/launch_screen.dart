import 'package:vision_aid/letter_rec.dart';
import 'package:flutter/material.dart';
import 'package:vision_aid/main.dart';
import 'detector.dart';
import 'extra_reference(speech_rec).dart';
import 'speech_recognition.dart';
import 'ui/home_view.dart';
import 'reference.dart';
import 'detector2.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'home_copy.dart';
import 'settings.dart';
import 'recognition_buttonchange.dart';
class LaunchPage extends StatefulWidget {
  LaunchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
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
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            print(_text);
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            if (_text == "open object detector" || _text == "open object recognition" || _text == "object detection" || _text == "object recognizer" ||_text == "detect objects"|| _text == "recognize objects"){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(cameras))
              );
            }
            if (_text == "open letter recognition"){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LetterRecognitionPage(title: "Letter Recognition"))
              );
            }
            if (_text == "open settings"){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingPage(title: "Settings"))
              );
            }
            if (_text == "Mute??"){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LetterRecognitionPage(title: "Letter Recognition"))
              );
            }
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
      body:
      Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded(
                flex:30,
                child:
                Container(
                  width:double.infinity,
                  margin: EdgeInsets.only(left:10,right:10,top:10,bottom:10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                      ),
                      onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(cameras))
                    );
                  },
                      child: Text('Object Detection',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 24 ),)
                  ),
                ),
            ),
            Expanded(
              flex:30,
                child: Container(
                  width:double.infinity,
                  margin: EdgeInsets.only(left:10,right:10,top:10,bottom:10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.indigoAccent),
                  ),

                      onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView())
                    );
                  },
                      child: Text(
                        'Letter Recognition',
                        style: TextStyle(fontWeight:FontWeight.bold,fontSize: 24 ),
                      )
                  ),

                  ),
                ),
            Expanded(
                flex:30,
                child: Container(
                  width:double.infinity,
                    margin: EdgeInsets.only(left:10,right:10,top:10,bottom:10),
                    child:ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
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
                          style: TextStyle(fontWeight:FontWeight.bold,fontSize: 24 ),)
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
