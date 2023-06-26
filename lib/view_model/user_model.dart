import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String userId, email, name, phone;
  late int log;
 late bool pay;
 late List course;
  UserModel(this.email, this.name, this.userId, this.phone,this.pay,this.log,this.course);

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map["userId"];
    email = map["email"];
    name = map["name"];
    course=map['course'];
    phone = map["phone"];
    log=map["log"];
    pay = map["pay"] ?? false;
  }
  toJson() {
    return {
      "userId": userId,
      "email": email,
       'log':log,
       "course":course,
      "name": name,
      "pay": pay,
    };
  }
  static const NUMBER = 'number';
  static const ID = 'id';



}
