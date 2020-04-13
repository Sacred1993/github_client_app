import 'package:flutter/material.dart';
import 'package:github_client_app/animation/grow_transition.dart';

/**
 * Author: xuyanpeng
 * Date: 2020/4/8 16:00
 * Description:
 */
class AnimationTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationTestState();
  }
}

class AnimationTestState extends State<AnimationTest>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  Animation<int> animation2;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        new AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation=CurvedAnimation(parent: animationController, curve: Curves.bounceIn);

    animation2 = new Tween(begin: 0, end: 300).animate(animation)
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GrowTransition(
        child: Image.asset("imgs/avatar-default.png"),
        animation: animation,
        controller: animationController,
      ),
    );
  }
}
