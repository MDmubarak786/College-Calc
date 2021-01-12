import 'package:flutter/material.dart';
import '../../main.dart';
import './ResultPage.dart';
import 'dart:async';

class GPAcalc extends StatefulWidget {
  final int n;

  GPAcalc(this.n);

  @override
  GPAcalcstate createState() => new GPAcalcstate();
}

class GPAcalcstate extends State<GPAcalc> {
  static const _kbcolorBack = Color(0xFF121212); // BackGround Color black
  static const _kbcolorLetter = Color(0xFFf1faee); // Letter Color white
  static const _kbcolorAppBar = Color(0xFF343535); // appbar Color gray
  static const _kbcolorButton = Color(0xFF597BEB); // button Color blue light

  List<String> _items = ['10', '9', '8', '7', '6', '5', 'RE/Ab/IA'].toList();
  List<String> _itemsCp =
      ['1', '1.5', '2', '2.5', '3', '3.5', '4', '4.5', '5'].toList();
  var _selection;
  var _selectionCp;
  var list;

  @override
  void initState() {
    super.initState();
    _selection = new List<String>()..length = widget.n;
    _selectionCp = new List<String>()..length = widget.n;
    list = new List<int>.generate(widget.n, (i) => i);
  }

  @override
  Widget build(BuildContext context) {
    double sogxc = 0, soc = 0;
    var fields = <Widget>[];
    bool safeToNavigate = true;
    fields.add(
      new Row(
          children: [
        new Padding(
          padding: new EdgeInsets.only(left: 95.0),
        ),
        new Column(


            children: [
          new Text(
            "Grade Point",
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
                color: _kbcolorLetter,
                fontWeight: FontWeight.bold,
                fontSize: 17.0),
          ),
        ]),
        SizedBox(width:MediaQuery.of(context).size.width/5,),
        new Column(
          children: [
            new Text(
              "Credits",
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                  color: _kbcolorLetter,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0),
            ),
          ],
        ),
        new Padding(
          padding: new EdgeInsets.only(bottom: 25.0),
        ),
      ]
      ),
    );
    list.forEach((i) {
      fields.add(
        new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            new Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Text(
                    "Subject ${i + 1} :",
                    style: new TextStyle(
                        color: _kbcolorLetter,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(10.0),
                  ),
                  new DropdownButton<String>(
                    dropdownColor: Color(0xFF797b84),
                    style: TextStyle(
                      color: _kbcolorLetter,
                      fontWeight: FontWeight.bold,
                    ),
                    underline: Container(
                      height: 2,
                      color: _kbcolorButton,
                    ),
                    hint: Center(
                      child: new Text(
                        "GP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: _kbcolorLetter,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    value: _selection[i],
                    items: _items.map((String item) {
                      return new DropdownMenuItem<String>(
                        value: item,
                        child: Center(
                          child: new Text(
                            item,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (s) {
                      setState(() {
                        _selection[i] = s;
                      });
                    },
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(35.0),
                  ),
                  new DropdownButton<String>(
                    dropdownColor: Color(0xFF797b84),
                    style: TextStyle(
                        color: _kbcolorLetter, fontWeight: FontWeight.bold),
                    hint: new Text(
                      "credit",
                      style: TextStyle(
                          color: _kbcolorLetter, fontWeight: FontWeight.normal),
                    ),
                    underline: Container(
                      height: 2,
                      color: _kbcolorButton,
                    ),
                    value: _selectionCp[i],
                    items: _itemsCp.map((String items) {
                      return new DropdownMenuItem<String>(
                        value: items,
                        child: Center(
                          child: new Text(
                            items,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (s) {
                      setState(() {
                        _selectionCp[i] = s;
                      });
                    },
                  ),
                ]),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      );
    });

    double res = 0.0;

    return SafeArea(
      child: new Scaffold(
        backgroundColor: _kbcolorBack,
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("GPA calculator"),
          backgroundColor: _kbcolorAppBar,
        ),
        body: new Container(
          decoration: new BoxDecoration(
              border: new Border.all(color: Colors.transparent, width: 30.0)),
          child: new ListView(
            children: fields,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 60,
          width: 150,
          child: new FloatingActionButton.extended(
            backgroundColor: _kbcolorButton,
            label: new Text(
              "Calculate",
              style: TextStyle(color: _kbcolorLetter, fontSize: 25),
            ),
            onPressed: () {
              for (int i = 0; i < widget.n; i++) {
                if (_selectionCp[i] == null) {
                  safeToNavigate = false;
                  continue;
                }
                if (_selection[i] == null) {
                  safeToNavigate = false;
                  continue;
                }
                double r = double.parse(_selectionCp[i]);
                int gp = calculate(_selection[i]);
                double cp = r;
                double gxc = gp * cp;
                sogxc += gxc;
                soc += cp;
              }
              res = sogxc / soc;
              if (safeToNavigate)
                Navigator.push(context, SizeRoute(page: ScorePage(res)));
              else {
                alert();
              }
            },
          ),
        ),
      ),
    );
  }

  int calculate(var a) {
    if (a == "10") return 10;
    if (a == "9") return 9;
    if (a == "8") return 8;
    if (a == "7") return 7;
    if (a == "6") return 6;
    if (a == "5") return 5;
    if (a == "RE/Ab/IA") return 0;
    return 0;
  }

  Future<Null> alert() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Please enter some value'),
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
