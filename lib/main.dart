import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'launch_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'recognition_buttonchange.dart';
//import 'speech_input2.dart';
import 'package:camera/camera.dart';
import 'settings_copy.dart';
//import 'settings_ui.dart';
import 'editing_speech_input2.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visual Aid',
      theme: ThemeData(

        dividerTheme: DividerThemeData(
          space:40,
          thickness: 10,
          color: Colors.black54,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

    ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _pagelist= [];

  @override
  void initState(){
    _pagelist
      ..add(Speech_SynthPage(title:"Speech Recognition"))
      ..add(SettingPage(title: 'Home Screen'))
      ..add(SpeechRecognitionPage());
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      //title: Text(widget.title),
      //),
      body: _pagelist[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.mic),
              label: 'Speak',
              backgroundColor: Colors.lightBlueAccent,

            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.lightBlueAccent
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
                backgroundColor: Colors.lightBlueAccent
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.lightBlueAccent
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}