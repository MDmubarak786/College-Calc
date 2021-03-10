

class ScorePage extends StatelessWidget {

  static const _kbcolorBack = Color(0xFF121212); // BackGround Color black
  static const _kbcolorLetter = Color(0xFFf1faee); // Letter Color white
  static const _kbcolorButton = Color(0xFF597BEB); // button Color blue light

  final double score;
  ScorePage(this.score);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Material(
          color:  _kbcolorBack,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text("Your GPA is : ",
                      style: new TextStyle(
                          color: _kbcolorLetter,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0)),
                  new Text(
                      score.toStringAsFixed(
                          score.truncateToDouble() == score ? 0 : 2),
                      style: new TextStyle(
                          color: _kbcolorLetter,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0)),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: FlatButton(
                      child: Text(
                        "Home",
                        style: TextStyle(color: _kbcolorLetter,fontSize: 30.0),
                      ),
                      color: _kbcolorButton,
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => new HomeAlone()),
                          (Route route) => route == null),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 20,
                    ),
                  ),
                  Container(
                    height: 50.0,
                    child: FlatButton(
                      child: Text(
                        "Again",
                        style: TextStyle(color: _kbcolorLetter,fontSize: 30.0),
                      ),
                      color: _kbcolorButton,
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => new GPA()),
                          (Route route) => route == null),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
