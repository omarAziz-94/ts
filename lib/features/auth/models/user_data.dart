import 'dart:convert';

/// lang : "any string"
/// email : "any string"
/// id : "aute deserunt id"
/// firstName : "any string"
/// lastName : "any string"
/// phone : "any string"
/// isAdmin : true
/// isStaff : true
/// birthDate : "2020-02-19T10:00:00.000Z"
/// createdAt : "2020-02-19T10:00:00.000Z"
/// updatedAt : "2020-02-19T10:00:00.000Z"
UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.lang,
    this.email,
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.isAdmin,
    this.isStaff,
    this.birthDate,
    this.createdAt,
    this.updatedAt,
  });

  UserData.fromJson(dynamic json) {
    lang = json['lang'];
    email = json['email'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    isAdmin = json['isAdmin'];
    isStaff = json['isStaff'];
    birthDate = json['birthDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? lang;
  String? email;
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  bool? isAdmin;
  bool? isStaff;
  String? birthDate;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lang'] = lang;
    map['email'] = email;
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phone'] = phone;
    map['isAdmin'] = isAdmin;
    map['isStaff'] = isStaff;
    map['birthDate'] = birthDate;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
