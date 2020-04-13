import 'package:flutter/material.dart';
import 'package:github_client_app/animation/animate_widget/animated_decorated_box.dart';

/**
 * Author: xuyanpeng
 * Date: 2020/4/13 16:44
 * Description:
 */
class AnimatedWidgetsTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedWidgetsTestState();
  }
}

class AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10.0;
  double _left = 0;
  var _align = Alignment.topRight;
  double _height = 100;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;


  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);
    return Scaffold(
      appBar: AppBar(
        title: Text("dddd"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _padding = 20.0;
              });
            },
            child: AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: duration,
              child: Text("AnimatedPadding"),
            ),
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: duration,
                  left: _left,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _left = 100;
                      });
                    },
                    child: Text("AnimatedPositioned"),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: AnimatedAlign(
              alignment: _align,
              duration: duration,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _align = Alignment.topLeft;
                  });
                },
                child: Text("AnimatedPositioned"),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            color: _color,
            height: _height,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _color = Colors.blue;
                  _height = 150;
                });
              },
              child: Text(
                "AnimatedContainer",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: Text(
                  "AnimatedDefaultTextStyle",
                ),
                onTap: () {
                  setState(() {
                    _style = TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                    );
                  });
                },
              ),
              style: _style,
              duration: duration),
          AnimatedDecoratedBox(
            duration: duration,
            decoration: BoxDecoration(color: _decorationColor),
            child: FlatButton(
              child: Text("AnimatedDecoratedBox"),
              onPressed: (){
                setState(() {
                  _decorationColor = Colors.red;
                });
              },
            ),
          )
        ].map((e){
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: e,
          );
        }).toList(),
      ),
    );
  }
}
