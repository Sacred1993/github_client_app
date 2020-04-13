import 'package:flutter/material.dart';

class Client {
  int id;
  String name;
  int age;
  bool sex;

  Client({this.id, this.name, this.age, this.sex});

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        sex: json["sex"] == 1,
      );

  Map<String,dynamic> toMap()=>{
    "id":id,
    "name":name,
    "age":age,
    "sex":sex,
  };
}
