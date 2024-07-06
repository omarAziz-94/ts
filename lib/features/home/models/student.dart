// import 'dart:convert';
//
// import 'package:parent/core/utils/date_time_utils.dart';
//
// /// name : "any string"
// /// email : "any string"
// /// phone : "any string"
// /// birthDate : "2020-02-19T10:00:00.000Z"
// /// id : 12
// /// image : "any string"
// /// createdAt : "2020-02-19T10:00:00.000Z"
//
// Student studentFromJson(String str) => Student.fromJson(json.decode(str));
//
// String studentToJson(Student data) => json.encode(data.toJson());
//
// class Student {
//   Student({
//     this.name,
//     this.email,
//     this.phone,
//     this.birthDate,
//     this.id,
//     this.image,
//     this.createdAt,
//   });
//
//   Student.fromJson(dynamic json) {
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     birthDate = DateTimeUtils.dateOrNull(json['birthDate']);
//     id = json['id'];
//     image = json['image'];
//     createdAt = DateTimeUtils.dateOrNull(json['createdAt']);
//   }
//
//   String? name;
//   String? email;
//   String? phone;
//   DateTime? birthDate;
//   int? id;
//   String? image;
//   DateTime? createdAt;
//
//   Student copyWith({
//     String? name,
//     String? email,
//     String? phone,
//     DateTime? birthDate,
//     int? id,
//     String? image,
//     DateTime? createdAt,
//   }) =>
//       Student(
//         name: name ?? this.name,
//         email: email ?? this.email,
//         phone: phone ?? this.phone,
//         birthDate: birthDate ?? this.birthDate,
//         id: id ?? this.id,
//         image: image ?? this.image,
//         createdAt: createdAt ?? this.createdAt,
//       );
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = name;
//     map['email'] = email;
//     map['phone'] = phone;
//     map['birthDate'] = birthDate?.toIso8601String();
//     map['id'] = id;
//     map['image'] = image;
//     map['createdAt'] = createdAt?.toIso8601String();
//     return map;
//   }
// }
