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

class SchedulePage extends StatefulWidget {
  SchedulePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int _currentIndex=0;

  List cardList=[
    Monday(),
    Tuesday(),
    Wednesday(),
    Thursday(),
    Friday(),
    Saturday(),
    Sunday(),

  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {

    List mondaySchedule = [
      //List category = [
       // "wonk",
      //],




    ];

    List tuesdaySchedule = [

    ];


    List wednesdaySchedule = [

    ];

    List thursdaySchedule = [

    ];

    List fridaySchedule = [

    ];

    List saturdaySchedule = [

    ];

    List sundaySchedule = [

    ];




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

        //BACKUP
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(

                    margin: EdgeInsets.only(top: 50, bottom: 50 ),//bottom: 30),
                    child: Text("Daily Schedules",
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
              margin: EdgeInsets.only(bottom: 20),
              child: CarouselSlider(
                  options: CarouselOptions(
                    height: 420.0,
                    autoPlay: false,
                    //autoPlayInterval: Duration(seconds: 3),
                    //autoPlayAnimationDuration: Duration(milliseconds: 800),
                    //autoPlayCurve: Curves.fastOutSlowIn,
                    //pauseAutoPlayOnTouch: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: cardList.map((card){
                    return Builder(
                        builder:(BuildContext context){
                          return Container(
                            margin: EdgeInsets.only(bottom: 15,left:8,right: 8),
                            height: MediaQuery.of(context).size.height*0.30,
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              elevation: 7,
                              //color:cardColor1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.transparent,
                              child: card,
                              //ListView(
                                //children: [
                                  // Card(
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(15.0),
                                  //     child: SizedBox(
                                  //       width: 430,
                                  //       height: 700,
                                  //       child: Column(
                                  //         children: [
                                  //           Text(
                                  //             'Algorithms',
                                  //             style: TextStyle(
                                  //                 color: Colors.greenAccent[400],
                                  //                 fontSize: 30), //TextStyle
                                  //           ), //Text
                                  //           SizedBox(height: 10),
                                  //           Row(
                                  //             children: <Widget>[
                                  //               SizedBox(
                                  //                 width: 10,
                                  //               ), //SizedBox
                                  //               Text(
                                  //                 'Library Implementation Of Searching Algorithm: ',
                                  //                 style: TextStyle(fontSize: 17.0),
                                  //               ), //Text
                                  //               SizedBox(width: 10), //SizedBox
                                  //               /** Checkbox Widget **/
                                  //               Checkbox(
                                  //                 value: this.value,
                                  //                 onChanged: (bool value) {
                                  //                   setState(() {
                                  //                     this.value = value;
                                  //                   });
                                  //                 },
                                  //               ), //Checkbox
                                  //             ], //<Widget>[]
                                  //           ), //Row
                                  //         ],
                                  //       ), //Column
                                  //     ), //SizedBox
                                  //   ), //Padding
                                  // ),

                                //],

                              //),
                            ),
                          );
                        }
                    );
                  }).toList(),
                ),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,

                    margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? Colors.black87 : Colors.grey,
                    ),
                  );
                }),
              ),


          ],
        ),
      )
    );
  }
}

class Monday extends StatelessWidget {
  //bool isSelected = false;
   Monday({ Key? key}) : super(key: key);
  
  bool _isSelected=false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent.shade100,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Monday",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                ListView(
                  children: <Widget>[
                     CheckboxListTile(
                      title: Text("Memorization"),
                      subtitle: Text("Match Me!"),
                      controlAffinity:
                        ListTileControlAffinity.platform,
                      value: _isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          _isSelected = value!;
                        });
                      },
                    )

                  ],
                )
              ],
              
            ),
          ),
          // Text(
          //     "Data",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 22.0,
          //         fontWeight: FontWeight.bold
          //     )
          // ),
          // Text(
          //     "Data",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 17.0,
          //         fontWeight: FontWeight.w600
          //     )
          // ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class Tuesday extends StatelessWidget {
  const Tuesday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange.shade200,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Tuesday",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Wednesday extends StatelessWidget {
  const Wednesday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow.shade200,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Wednesday",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Thursday extends StatelessWidget {
  const Thursday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,

        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Thursday",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Friday extends StatelessWidget {
  const Friday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Friday",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Saturday extends StatelessWidget {
  const Saturday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Saturday",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Sunday extends StatelessWidget {
  const Sunday({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [Color(0xffff4000),Color(0xffffcc66),]
        ),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:30,top:25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Sunday",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

