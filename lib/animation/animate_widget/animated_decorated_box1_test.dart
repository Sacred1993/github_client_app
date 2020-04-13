import 'package:flutter/material.dart';
import 'package:github_client_app/animation/animate_widget/animated_decorated_box.dart';
import 'package:github_client_app/animation/animate_widget/animated_decorated_box1.dart';

/**
 * Author: xuyanpeng
 * Date: 2020/4/10 17:21
 * Description:
 */
class AnimatedDecoratedBox1Test extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimatedDecoratedBox1TestState();
  }
}

class AnimatedDecoratedBox1TestState extends State<AnimatedDecoratedBox1Test>{
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedDecoratedBox1Test"),),
      body: Center(
        child: AnimatedDecoratedBox(
          duration: duration,
          decoration: BoxDecoration(color: _decorationColor),
          child: FlatButton(
            onPressed: () {
              setState(() {
                _decorationColor = Colors.red;
              });
            },
            child: Text(
              "AnimatedDecoratedBox",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

}
