import 'package:flutter/material.dart';

/**
 * Author: xuyanpeng
 * Date: 2020/4/10 15:56
 * Description:
 */
class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(key: key, curve: curve, duration: duration);

  final BoxDecoration decoration;
  final Widget child;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _tween.evaluate(animation),
      child: widget.child,
    );
  }

  //现在forEachTween的作用就很明显了，它正是用于来更新Tween的初始值的
  @override
  void forEachTween(visitor) {
    _tween = visitor(
        _tween, widget.decoration, (value) => DecorationTween(begin: value));
  }
}
