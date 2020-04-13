import 'package:flutter/material.dart';
import 'package:github_client_app/animation/animated_switcher/my_slide_transition.dart';
import 'package:github_client_app/animation/animated_switcher/slide_transitionX.dart';

/**
 * Author: xuyanpeng
 * Date: 2020/4/9 15:54
 * Description:
 */
class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return SlideTransitionX(child: child, position: animation,direction: AxisDirection.up,);
//                return MySlideTransition(child: child, position: tween.animate(animation));

                //执行缩放动画
//                return ScaleTransition(child: child, scale: animation);
//                return FadeTransition(child: child, opacity: animation);
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: const Text('+1',),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
