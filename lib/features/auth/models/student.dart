import 'dart:convert';

import '../../../core/utils/date_time_utils.dart';
import 'station.dart';

/// name : "any string"
/// email : "any string"
/// phone : "any string"
/// birthDate : "2020-02-19T10:00:00.000Z"
/// id : 12
/// image : "any string"
/// createdAt : "2020-02-19T10:00:00.000Z"
/// updatedAt : "2020-02-19T10:00:00.000Z"
/// station : {"name":"any string","description":"any string","longitude":"any string","latitude":"any string","id":12,"image":"any string"}
/// nfcCard : {"code":"any string","id":12,"createdAt":"2020-02-19T10:00:00.000Z","updatedAt":"2020-02-19T10:00:00.000Z"}

Student studentsFromJson(String str) => Student.fromJson(json.decode(str));

String studentsToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    this.name,
    this.email,
    this.phone,
    this.birthDate,
    this.id,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.station,
    this.grade,
    this.nfcCard,
  });

  Student.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    birthDate = DateTimeUtils.dateOrNull(json['birthDate']);
    id = json['id'];
    image = json['image'];
    createdAt = DateTimeUtils.dateOrNull(json['createdAt']);
    updatedAt = DateTimeUtils.dateOrNull(json['updatedAt']);
    grade = json['grade'] != null ? Grade.fromJson(json['grade']) : null;
    station =
        json['station'] != null ? Station.fromJson(json['station']) : null;
    nfcCard =
        json['nfcCard'] != null ? NfcCard.fromJson(json['nfcCard']) : null;
  }

  String? name;
  String? email;
  String? phone;
  DateTime? birthDate;
  num? id;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  Station? station;
  NfcCard? nfcCard;
  Grade? grade;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['birthDate'] = birthDate?.toIso8601String();
    map['id'] = id;
    map['image'] = image;
    map['createdAt'] = createdAt?.toIso8601String();
    map['updatedAt'] = updatedAt?.toIso8601String();
    if (station != null) {
      map['station'] = station?.toJson();
    }
    if (grade != null) {
      map['grade'] = grade?.toJson();
    }
    if (nfcCard != null) {
      map['nfcCard'] = nfcCard?.toJson();
    }
    return map;
  }
}

/// code : "any string"
/// id : 12
/// createdAt : "2020-02-19T10:00:00.000Z"
/// updatedAt : "2020-02-19T10:00:00.000Z"

NfcCard nfcCardFromJson(String str) => NfcCard.fromJson(json.decode(str));

String nfcCardToJson(NfcCard data) => json.encode(data.toJson());

class NfcCard {
  NfcCard({
    this.code,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  NfcCard.fromJson(dynamic json) {
    code = json['code'];
    id = json['id'];
    createdAt = DateTimeUtils.dateOrNull(json['createdAt']);
    updatedAt = DateTimeUtils.dateOrNull(json['updatedAt']);
  }

  String? code;
  num? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  NfcCard copyWith({
    String? code,
    num? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      NfcCard(
        code: code ?? this.code,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['id'] = id;
    map['createdAt'] = createdAt?.toIso8601String();
    map['updatedAt'] = updatedAt?.toIso8601String();
    return map;
  }
}

/// id : 3
/// name : "Grade 2"
/// order : 2

Grade gradeFromJson(String str) => Grade.fromJson(json.decode(str));

String gradeToJson(Grade data) => json.encode(data.toJson());

class Grade {
  Grade({
    this.id,
    this.name,
    this.order,
  });

  Grade.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
  }

  num? id;
  String? name;
  num? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['order'] = order;
    return map;
  }
}
