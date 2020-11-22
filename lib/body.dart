import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO list initialization
  List<String> operators = ["+", "-", "×", "÷"];
  List<String> hist = [];
  //TODO variables initialization
  var history = "", output = "", answer = 0.0;
  //TODO row 1 FUNCTIONS
  void clear() {
    setState(() {
      history = "";
      output = "0";
      answer = 0.0;
      hist = [];
    });
  }

  void signs() {
    setState(() {
      if (double.parse(output) == 0.0) {
      } else {
        if (output[0] == '-') {
          output = output.substring(1);
        } else {
          output = '-' + output;
        }
      }
    });
  }

  void percent() {
    setState(() {
      double percent = 0.0;
      percent = answer / 100;
      history = answer.toString() + " ÷ 100 =";
      output = percent.toString();
    });
  }

  void div() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("÷");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  //TODO row 2 FUNCTIONS
  void click1() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "1";
      } else {
        output = "1";
      }
    });
  }

  void click2() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "2";
      } else {
        output = "2";
      }
    });
  }

  void click3() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "3";
      } else {
        output = "3";
      }
    });
  }

  void mul() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("×");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  //TODO row 3 FUNCTIONS
  void click4() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "4";
      } else {
        output = "4";
      }
    });
  }

  void click5() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "5";
      } else {
        output = "5";
      }
    });
  }

  void click6() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "6";
      } else {
        output = "6";
      }
    });
  }

  void sub() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("-");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  //TODO row 4 FUNCTIONS
  void click7() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "7";
      } else {
        output = "7";
      }
    });
  }

  void click8() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "8";
      } else {
        output = "8";
      }
    });
  }

  void click9() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "9";
      } else {
        output = "9";
      }
    });
  }

  void add() {
    setState(() {
      answer = double.parse(output);
      hist.add(output);
      hist.add("+");
      if (hist.length >= 3) {
        output = "0";
        equals();
      }
      output = "0";
      history = getTape();
    });
  }

  //TODO row 5 FUNCTIONS
  void click0() {
    setState(() {
      if (double.parse(output) != 0.0) {
        output += "0";
      } else {
        output = "0";
      }
    });
  }

  void clickDot() {
    setState(() {
      output += ".";
    });
  }

  void equals() {
    setState(() {
      if (hist.length <= 3) {
        hist.add(output);
      }
      history = getTape() + " =";
      var opr1, opr2, op;
      opr1 = double.parse(hist.removeAt(0));
      op = hist.removeAt(0);
      opr2 = double.parse(hist.removeAt(0));
      switch (op) {
        case "+":
          answer = opr1 + opr2;
          break;
        case "-":
          answer = opr1 - opr2;
          break;
        case "×":
          answer = opr1 * opr2;
          break;
        case "÷":
          answer = opr1 / opr2;
          break;
        default:
      }
      output = answer.toString();
      hist.insert(0, answer.toString());
    });
  }

  //TODO More Functions
  String getTape() {
    return hist.join(" ");
  }

  bool isOperator(String s) {
    return (operators.contains(s));
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //TODO history text
          new Padding(
            padding: new EdgeInsets.only(top: 25.0, right: 15.0),
            child: new Text(
              "$history",
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          //TODO output text
          new Padding(
            padding: new EdgeInsets.only(top: 15.0, right: 15.0, bottom: 15.0),
            child: new Text(
              "$output",
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.w200,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          //TODO row 1
          new Padding(
            padding: new EdgeInsets.only(top: 15.0, left: 5.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //TODO block button
                  new RawMaterialButton(
                    onPressed: clear,
                    child: new Icon(
                      Icons.block,
                      size: 35.0,
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.yellow.shade700,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: signs,
                    child: new Text(
                      "±",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.yellow.shade700,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: percent,
                    child: new Text(
                      "%",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.yellow.shade700,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: div,
                    child: new Text(
                      "÷",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.yellow.shade700,
                    padding: const EdgeInsets.all(15.0),
                  ),
                ]),
          ),
          //TODO row 2
          new Padding(
            padding: new EdgeInsets.only(top: 15.0, left: 5.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RawMaterialButton(
                    onPressed: click1,
                    child: new Text(
                      "1",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: click2,
                    child: new Text(
                      "2",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: click3,
                    child: new Text(
                      "3",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: mul,
                    child: new Text(
                      "×",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.yellow.shade700,
                    padding: const EdgeInsets.all(15.0),
                  )
                ]),
          ),
          //TODO row 3
          new Padding(
            padding: new EdgeInsets.only(top: 15.0, left: 5.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RawMaterialButton(
                    onPressed: click4,
                    child: new Text(
                      "4",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: click5,
                    child: new Text(
                      "5",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: click6,
                    child: new Text(
                      "6",
                      style: TextStyle(
                          fontSize: 35.0, fontWeight: FontWeight.bold),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: sub,
                    child: new Text(
                      "-",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.yellow.shade700,
                    padding: const EdgeInsets.all(15.0),
                  )
                ]),
          ),
          //TODO row 4
          new Padding(
            padding: new EdgeInsets.only(top: 15.0, left: 5.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RawMaterialButton(
                    onPressed: click7,
                    child: new Text(
                      "7",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: click8,
                    child: new Text(
                      "8",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: click9,
                    child: new Text(
                      "9",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: add,
                    child: new Text(
                      "+",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.yellow.shade700,
                    padding: const EdgeInsets.all(15.0),
                  )
                ]),
          ),
          //TODO row 5
          new Padding(
            padding: new EdgeInsets.only(top: 15.0, left: 5.0, bottom: 6.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RawMaterialButton(
                    onPressed: click0,
                    child: new Text(
                      "0",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    constraints: BoxConstraints.tightFor(width: 170.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0)),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: clickDot,
                    child: new Text(
                      ".",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.grey,
                    padding: const EdgeInsets.all(15.0),
                  ),
                  new RawMaterialButton(
                    onPressed: equals,
                    child: new Text(
                      "=",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    fillColor: Colors.yellow.shade700,
                    padding: const EdgeInsets.all(15.0),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
