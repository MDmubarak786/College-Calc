import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'CgpaCalc.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  static const _kbcolorBack = Color(0xFF121212); // BackGround Color black
  static const _kbcolorLetter = Color(0xFFf1faee); // Letter Color white
  static const _kbcolorAppBar = Color(0xFF343535); // appbar Color gray
  static const _kbcolorButton = Color(0xFF597BEB); // button Color blue light

  TextEditingController semController = new TextEditingController();
  int n;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("CGPA calculator",style: TextStyle(color: _kbcolorLetter),),
            backgroundColor: _kbcolorAppBar),
        backgroundColor: _kbcolorBack,
        body: Container(
          // decoration: BoxDecoration(
          //     border: Border.all(color: Colors.transparent, width: 25.0),
          //     color: Colors.transparent),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: _kbcolorLetter, fontSize: 25.0,fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                  autofocus: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                      ),
                     // fillColor: Colors.lightBlueAccent,
                      hintText: "Enter Number of Semesters",
                      hintStyle: TextStyle(color: _kbcolorLetter)),
                  keyboardType: TextInputType.number,
                  controller: semController,
                  onChanged: (String str) {
                    setState(() {
                      if (semController.text == "") {
                        n = 0;
                      } else {
                        n = int.parse(semController.text);
                      }
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  margin: EdgeInsets.all(25),
                  child: FlatButton(
                    child: Text(
                      'NEXT',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: _kbcolorButton,
                    textColor: _kbcolorLetter,
                    onPressed: () {
                      if (n is int && n > 0) {
                        int pass = n;
                        n = 0;
                        semController.text = "";
                        Navigator.push(context, SizeRoute(page: CgpaCalc(pass)));
                      } else {
                        semController.text = "";
                        alert();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  alert() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please enter number of semester to calculate CGPA'),
          actions: <Widget>[
            FlatButton(
              child: new Text(
                'Back',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
