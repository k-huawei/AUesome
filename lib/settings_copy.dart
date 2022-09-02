import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 60,
              child: Image(
                  image: NetworkImage('https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg'),
                  fit: BoxFit.cover
              ),
            ),
            Expanded(
                flex: 15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deliver by 10:45am",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Joe's Burger",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text("3 items, 1.3 miles"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(30),
                        child: Text("30 mins")
                    )
                  ],
                )
            ),
            Expanded(
                flex: 25,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "\$7.00",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("include DoorDash pay and customer tips"),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20),
                        width: 300,
                        child: ElevatedButton(
                          onPressed: (){

                          },
                          child: Text("Accept"),
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}