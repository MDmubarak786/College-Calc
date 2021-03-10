import 'package:collegecalc/pages/CGPA/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import './pages/GPA/GpaPage.dart';
import 'package:url_launcher/url_launcher.dart';






class HomeAlone extends StatefulWidget {
  @override
  _HomeAloneState createState() => _HomeAloneState();
}

class _HomeAloneState extends State<HomeAlone> {
  static const _kbcolorBack = Color(0xFF121212); // BackGround Color black
  static const _kbcolorLetter = Color(0xFFf1faee); // Letter Color white
  static const _kbcolorAppBar = Color(0xFF343535); // appbar Color gray
  static const _kbcolorButton = Color(0xFF597BEB);
  // button Color blue light

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black38);
    return SafeArea(
      child: Scaffold(
        backgroundColor: _kbcolorBack,
        appBar: new AppBar(
          centerTitle: true,
          elevation: 5.0,
          title: new Text(
            "College Calc",
            style: TextStyle(fontSize: 29.0, color: _kbcolorLetter),
          ),
          backgroundColor: _kbcolorAppBar,
        ),
        drawer: SafeArea(
          child: Drawer(
            child: Container(
              color: _kbcolorBack,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child: Image.asset(
                      "assets/images/2.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Draw()));
                    },
                    title: Text(
                      "About",
                      style: TextStyle(color: _kbcolorLetter),
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    indent: 15.0,
                    endIndent: 15.0,
                    color: Color(0xFF85988C),
                  ),
                  ListTile(
                    title: Text("Rate this App",
                        style: TextStyle(color: _kbcolorLetter)),
                  ),
                  Divider(
                    thickness: 0.5,
                    indent: 15.0,
                    endIndent: 15.0,
                    color: Color(0xFF85988C),
                  ),
                  SizedBox(
                    height: 250.0,
                  ),
                  Center(
                    child: Container(
                        child: Text(
                      "Made this App with ❤️",
                      style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          color: _kbcolorLetter),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            //
            children: [
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Welcome Buddy 🤞",
                      style: TextStyle(fontSize: 30.0, color: _kbcolorLetter),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, SizeRoute(page: GPA()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _kbcolorButton,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      height: 200,
                      width: 200,
                      child: Center(
                          child: Text(
                        "GPA",
                        style: TextStyle(color: _kbcolorLetter, fontSize: 50.0),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, SizeRoute(page: HomePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: _kbcolorButton,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: 200,
                  width: 200,
                  child: Center(
                      child: Text(
                    "CGPA",
                    style: TextStyle(color: _kbcolorLetter, fontSize: 50.0),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Align(
            child: SizeTransition(
              child: child,
              sizeFactor: animation,
            ),
          ),
        );
}

class Draw extends StatefulWidget {
  @override
  _DrawState createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  static const _kbcolorBack = Color(0xFF121212); // BackGround Color black
  static const _kbcolorLetter = Color(0xFFf1faee); // Letter Color white
  static const _kbcolorAppBar = Color(0xFF343535); // appbar Color gray

  String _lunchFB = 'https://www.facebook.com/profile.php?id=100022367763572';
  String _lunchINS = 'https://www.instagram.com/scooby_doo.mk/';
  String _lunchTW = 'https://twitter.com/MMubarakoo7';

  Future<void> _luncgInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        enableJavaScript: true,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'could not lunch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kbcolorBack,
      appBar: new AppBar(
          centerTitle: true,
          elevation: 5.0,
          title: new Text(
            "College Calc",
            style: TextStyle(fontSize: 29.0, color: _kbcolorLetter),
          ),
          backgroundColor: _kbcolorAppBar),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Center(
                child: Text(
                  "Happy to see you here\nThanks for Downloading this App",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: _kbcolorLetter,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Center(
                child: Text(
                  "My Social Networks",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: _kbcolorLetter,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: 40.0,
                  icon: Image.asset("assets/images/f1.png", fit: BoxFit.fill),
                  onPressed: () {
                    _luncgInBrowser(_lunchFB);
                  }),
              IconButton(
                  iconSize: 40.0,
                  icon: Image.asset("assets/images/i1.png", fit: BoxFit.fill),
                  onPressed: () {
                    _luncgInBrowser(_lunchINS);
                  }),
              IconButton(
                  iconSize: 40.0,
                  icon: Image.asset("assets/images/t1.png", fit: BoxFit.fill),
                  onPressed: () {
                    _luncgInBrowser(_lunchTW);
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Center(
                child: Text(
                  "“You always pass failure on your way to success.” \n                   — Mickey Rooney",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: _kbcolorLetter),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Center(
                child: Text(
                  "Have a Nice Day 😍",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: _kbcolorLetter),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
