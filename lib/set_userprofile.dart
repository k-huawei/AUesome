import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'signup.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';


class InitialProfilePage extends StatefulWidget {
  InitialProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _InitialProfilePageState createState() => _InitialProfilePageState();
}

class _InitialProfilePageState extends State<InitialProfilePage> {

  DateTime _selectedDate = DateTime.now();



  //String? selectedCondition;
  final TextEditingController medConditionController = TextEditingController();

  @override
  // void dispose() {
  //   medConditionController.dispose();
  //   super.dispose();
  // }
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
        child:  Column(
          children: [
            Expanded(
              flex: 20,
              child: Container(
                width: 200,
                height: 120,
                margin: EdgeInsets.only(left:30,right: 30,bottom: 30,top: 100),
                child: TextFormField(
                  initialValue: 'Name',
                  decoration: InputDecoration(


                    border: OutlineInputBorder(),
                    // suffixIcon: Icon(
                    //   Icons.error,
                    // ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                margin: EdgeInsets.only(top:100),
                child: Text("Enter child's birthdate",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
          Expanded(
            flex:60,
            child: SizedBox(
            height: 250,
            child: ScrollDatePicker(
            selectedDate: _selectedDate,
            locale: Locale('en'),
            onDateTimeChanged: (DateTime value) {
              setState(() {
                  _selectedDate = value;
                  });
                },
              ),
            ),
          ),
      /// Showcase second image source
      // SizedBox(
      //   height: 250,
      //   child: ScrollDatePicker(
      //     selectedDate: _selectedDate,
      //     locale: Locale('ko'),
      //     scrollViewOptions: DatePickerScrollViewOptions(
      //       year: ScrollViewDetailOptions(
      //         label: '년',
      //         margin: const EdgeInsets.only(right: 8),
      //       ),
      //       month: ScrollViewDetailOptions(
      //         label: '월',
      //         margin: const EdgeInsets.only(right: 8),
      //       ),
      //       day: ScrollViewDetailOptions(
      //         label: '일',
      //       )
      //     ),
      //     onDateTimeChanged: (DateTime value) {
      //       setState(() {
      //         _selectedDate = value;
      //       });
      //     },
      //   ),
      // ),
      ],
      ),
      ),

        );

  }



}
