import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:carousel_slider/carousel_slider.dart';

class KitPage extends StatefulWidget {
  KitPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _KitPageState createState() => _KitPageState();
}

class _KitPageState extends State<KitPage> {

  var cardColor2 = const Color(0xff99B8FF);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/appbar.png'),
                  fit: BoxFit.fill
              ),

            ),
          ),

          //title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                    margin: EdgeInsets.only(left: 30, top: 30, bottom: 40 ),//bottom: 30),
                    child: Text("My Kit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        )
                    ),
                  ),

                ],
                // width: 200,
                // height: 75,

                //Image(
                //image: NetworkImage('https://codingmindsacademy.com/img/my/logo1.png'),
              ),
              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top:15, left:15,right:15),
                        child: Text('Complete Daily Activities',
                          style:
                          TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          )
                          ,),
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Container(
                            margin:EdgeInsets.only(left:20, top:10),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Communication Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),
                                Text("Sensory Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),
                                Text("Motor Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),],



                            ),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            margin: EdgeInsets.only(left:80, right: 25,top:20),
                            child: ElevatedButton(

                              onPressed: () {
                                // 1. Get the username(email) and password

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => SignupPage(title: 'Home Page')),
                                // );
                                //);
                              },
                              child: Text("Begin", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        //side: BorderSide(color: Colors.black)
                                      )
                                  )
                              ),


                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(left:10,right: 10, bottom:25),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top:15, left:15,right:15),
                        child: Text('Complete Daily Activities',
                          style:
                          TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          )
                          ,),
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Container(
                            margin:EdgeInsets.only(left:20, top:10),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Communication Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),
                                Text("Sensory Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),
                                Text("Motor Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),],



                            ),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            margin: EdgeInsets.only(left:80, right: 25,top:20),
                            child: ElevatedButton(

                              onPressed: () {
                                // 1. Get the username(email) and password

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => SignupPage(title: 'Home Page')),
                                // );
                                //);
                              },
                              child: Text("Begin", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        //side: BorderSide(color: Colors.black)
                                      )
                                  )
                              ),


                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.only(left:10,right: 10),
                height: 175,
                child: Card(
                  elevation: 7,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top:15, left:15,right:15),
                        child: Text('Complete Daily Activities',
                          style:
                          TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          )
                          ,),
                      ),
                      // const ListTile(
                      //   //leading: Text('Complete Daily Activites'),
                      //   //Icon(Icons.album),
                      //   title: ,
                      //   subtitle: Text('Communication, Motor, and Sensory Skills'),
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Container(
                            margin:EdgeInsets.only(left:20, top:10),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Communication Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),
                                Text("Sensory Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),
                                Text("Motor Skills",
                                  style: TextStyle(
                                      color: Colors.black45
                                  ),),],



                            ),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            margin: EdgeInsets.only(left:80, right: 25,top:20),
                            child: ElevatedButton(

                              onPressed: () {
                                // 1. Get the username(email) and password

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => SignupPage(title: 'Home Page')),
                                // );
                                //);
                              },
                              child: Text("Begin", style: TextStyle(fontSize:16, fontWeight: FontWeight.w500, color: Colors.black),),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        //side: BorderSide(color: Colors.black)
                                      )
                                  )
                              ),


                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        )
    );
  }
}
