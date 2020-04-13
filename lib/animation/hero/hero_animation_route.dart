import 'package:flutter/material.dart';
import 'package:github_client_app/animation/hero/hero_animation_routeB.dart';

/**
 * Author: xuyanpeng
 * Date: 2020/4/9 9:49
 * Description:
 */
// 路由A
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: ClipOval(
              child: Image.asset("imgs/avatar-default.png",
                width: 50.0,
              ),
            ),
          ),
          onTap: () {
            //打开B路由
//            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
//              return HeroAnimationRouteB();
//            }));
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
                  return new FadeTransition(
                    opacity: animation,
                    child: Scaffold(
                      appBar: AppBar(
                        title: Text("原图"),
                      ),
                      body: HeroAnimationRouteB(),
                    ),
                  );
                })
            );
          },
        ),
      ),
    );
  }
}