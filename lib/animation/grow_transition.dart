import 'package:flutter/material.dart';

/**
 * Author: xuyanpeng
 * Date: 2020/4/8 16:03
 * Description:
 */
class GrowTransition extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> controller;
  final Widget child;

  GrowTransition({this.animation, this.child,this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
  

}
