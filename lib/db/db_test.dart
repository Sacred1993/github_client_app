import 'package:flutter/material.dart';

class DbTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DbTestState();
  }
}

class DbTestState extends State<DbTest> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("数据库操作")),
      body: Container(
        child: Text("dd"),
      ),
    );
  }
}
