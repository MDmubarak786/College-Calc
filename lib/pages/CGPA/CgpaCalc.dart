import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import './ResultPage.dart';

class CgpaCalc extends StatefulWidget {
  final int n;
  CgpaCalc(this.n);

  @override
  CGPAcalcstate createState() => CGPAcalcstate();
}

class CGPAcalcstate extends State<CgpaCalc> {

  static const _kbcolorBack = Color(0xFF121212); // BackGround Color black
  static const _kbcolorLetter = Color(0xFFf1faee); // Letter Color white
  static const _kbcolorAppBar = Color(0xFF343535); // appbar Color gray
  static const _kbcolorButton = Color(0xFF597BEB); // button Color blue light

  List _sgpaController;
//  List _creditController;
  List list;

  @override
  void initState() {
    super.initState();

    _sgpaController = List<String>()..length = widget.n;

    //   _creditController = List<String>()..length = widget.n;

    list = List<int>.generate(widget.n, (i) => i);
  }

  @override
  Widget build(BuildContext context) {
    double sumOfCreditMulSGPA = 0;
    double cgpa = 0.0;
    var fields = <Widget>[];
    bool insertedValue = true;

    list.forEach((i) {
      fields.add(
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          //subject er text
          Text(
            "Semester ${i + 1} :",
            style: TextStyle(
                color: _kbcolorLetter,
               // fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),

          //sgpa er textField
          SizedBox(
            width: 85.0,
            child: TextField(
              style: TextStyle(
                  color: _kbcolorLetter, fontWeight: FontWeight.w400,fontSize: 20.0),

              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "CGPA",
                hintStyle: TextStyle(color: _kbcolorLetter),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _sgpaController[i] = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(35.0),
          ),

          //credit er textField
          // SizedBox(
          //   width: 60.0,
          //   child: TextField(
          //     keyboardType: TextInputType.number,
          //     decoration: InputDecoration(hintText: "CREDIT"),
          //     onChanged: (s) {
          //       setState(() {
          //         _creditController[i] = s;
          //       });
          //     },
          //   ),
          // ),
        ]),
      );
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "CGPA calculator",
            style: TextStyle(fontSize: 25.0,color: _kbcolorLetter),
          ),
          backgroundColor: _kbcolorAppBar,
          centerTitle: true,
        ),
        backgroundColor: _kbcolorBack,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                  children: [
                // Text(
                //   "Credits",
                //   overflow: TextOverflow.ellipsis,
                //   style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),
                // ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                ),
              ]),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 30.0)),
                child: Column(
                  children: fields,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RaisedButton(
                padding: EdgeInsets.all(10.0),
                color: _kbcolorButton,
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 30.0, color: _kbcolorLetter),
                ),
                onPressed: () {
                  int endvalue = widget.n;
                  for (int i = 0; i < endvalue; i++) {
                    // if(_creditController[i]==null){
                    //   insertedValue = false;
                    //   continue;
                    // }
                    if (_sgpaController[i] == null) {
                      insertedValue = false;
                      continue;
                    }

                    double sgpa = double.parse(_sgpaController[i]);
                    //   int credit = int.parse(_creditController[i]);

                    //   double creditMulSGPA = credit * sgpa;
                    sumOfCreditMulSGPA += sgpa;
                    // print("sgpa:$sgpa");
                    //sumOfCreditMulSGPA = sumOfCreditMulSGPA+creditMulSGPA
                    // sumOfCredit += sgpa; //
                    // print("sumOfCredit$sumOfCredit");+
                    // sumOfCredit = sumOfCredit+credit

                  }
                  // print("sumOfCreditMulSGPA$sumOfCreditMulSGPA");
                  // print("endvalue=$endvalue");
                  //print("sumOfCredit$sumOfCredit");

                  cgpa = sumOfCreditMulSGPA / endvalue;

                  if (insertedValue == true)
                    Navigator.push(context, SizeRoute(page: ResultPage(cgpa)));

                  else {
                    showAlertBox();
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  showAlertBox() {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please enter some value'),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Back",
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
