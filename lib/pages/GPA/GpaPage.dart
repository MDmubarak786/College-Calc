import 'package:flutter/material.dart';
import 'dart:async';
import '../../main.dart';
import './GpaCalc.dart';

class GPA extends StatefulWidget {
  @override
  GPAState createState() => new GPAState();
}

class GPAState extends State<GPA> {
  static const _kbcolorBack = Color(0xFF121212); // BackGround Color black
  static const _kbcolorLetter = Color(0xFFf1faee); // Letter Color white
  static const _kbcolorAppBar = Color(0xFF343535); // appbar Color gray
  static const _kbcolorButton = Color(0xFF597BEB); // button Color blue light
  TextEditingController controller = new TextEditingController();
  int n;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
            title: new Text(
              "GPA calculator",
              style: TextStyle(color: _kbcolorLetter),
            ),
            centerTitle: true,
            backgroundColor: _kbcolorAppBar),
        backgroundColor: _kbcolorBack,
        body: new Container(
          decoration: new BoxDecoration(
              border: new Border.all(color: Colors.transparent, width: 25.0),
              color: Colors.transparent),
          child: new ListView(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              new TextField(
                style: TextStyle(color: _kbcolorLetter, fontSize: 25.0),
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: new InputDecoration(
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

                    // fillColor: Colors.deepOrangeAccent,
                    hintText: "Enter Number of Subjects",
                    hintStyle: new TextStyle(color: _kbcolorLetter)),
                keyboardType: TextInputType.number,
                controller: controller,
                onChanged: (String str) {
                  setState(() {
                    if (controller.text == "") n = 0;
                    n = int.parse(controller.text);
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 50,
                  width: 100.0,
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
                        controller.text = "";
                        Navigator.push(context, SizeRoute(page: GPAcalc(pass)));
                      } else {
                        controller.text = "";
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

  Future<Null> alert() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Text('Please enter The number'),
          actions: <Widget>[
            new FlatButton(
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
