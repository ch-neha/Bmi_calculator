import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class Bmi {
  final double result;
  Bmi(this.result);
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double heigth = 130;
  double weight = 50;
  double result1 = 0;
  double calculatebmi() {
    return (weight * 10000 / (heigth * heigth));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(15.0),
          color: Colors.lightBlue[50],
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'HEIGHT',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        heigth.toString(),
                        style: TextStyle(fontSize: 60.0),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              SliderTheme(
                data: (SliderTheme.of(context).copyWith()),
                child: Slider(
                  value: heigth,
                  min: 100,
                  max: 200,
                  divisions: 100,
                  label: heigth.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      heigth = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(15.0),
          color: Colors.lightBlue[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'WEIGHT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weight.toString(),
                    style: TextStyle(fontSize: 60.0),
                  ),
                  Text(
                    'Kg',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                    elevation: 10.0,
                    fillColor: Colors.blueGrey,
                    child: Icon(
                      Icons.add,
                      size: 40.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        weight--;
                      });
                    },
                    elevation: 10.0,
                    fillColor: Colors.blueGrey,
                    child: Center(
                      child: Icon(
                        Icons.minimize,
                        size: 40.0,
                      ),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: RaisedButton(
                onPressed: () {
                  result1 = calculatebmi();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new OutputPage(bmi: new Bmi(result1))));
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 30.0),
                ),
                color: Colors.blueGrey[300],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OutputPage extends StatelessWidget {
  final Bmi bmi;
  OutputPage({Key key, @required this.bmi}) : super(key: key);
  final String output = '';

  String showResult() {
    if (bmi.result > 18.5 && bmi.result < 25)
      return 'You have a normal body weight.Good job!';
    else if (bmi.result < 18.5)
      return 'You have a lower than normal body weight. You can eat a bit more.';
    else
      return 'You have a higher than normal body weight. Try to exercise more.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text(
            'YOUR RESULT',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              color: Colors.lightBlue[50],
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "BMI: \n ${bmi.result}",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    showResult(),
                    style: TextStyle(fontSize: 30.0),
                  ),
                ],
              )),
          Container(
            height: 70.0,
            width: 200.0,
            child: RaisedButton(
              color: Colors.lightBlue[100],
              child: Text(
                "Go Back!",
                style: TextStyle(fontSize: 25.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            height: 70.0,
            width: 200.0,
            child: RaisedButton(
              color: Colors.lightBlue[100],
              child: Text(
                'COPY',
                style: TextStyle(fontSize: 25.0),
              ),
              onPressed: () {
                FlutterClipboard.copy(
                        ' Your BMI is :${bmi.result} ${showResult()}')
                    .then((value) => print('copied'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
