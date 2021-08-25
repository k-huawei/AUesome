import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'camera_tts.dart';

import 'boundbox.dart';
import 'launch_screen.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  static const String _model = "assets/ssd_mobilenet.tflite";
  static const String labels = "assets/labelmap.txt";


  loadModel() async {
    String res;
    res = await Tflite.loadModel(
        model: _model,
        labels: labels);

    print(res);
  }

  @override
  void initState() {
    super.initState();
    onSelect(ssd);
  }

  onSelect(model) {
    setState(() {
    });
    loadModel();
  }




  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LaunchPage(title: 'Home'))
              );
            }),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Camera(
              widget.cameras,
              _model,
              setRecognitions,
            ),
            BndBox(
              _recognitions == null ? [] : _recognitions,
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
            ),
          ],
        ),
      ),
    );
  }
}