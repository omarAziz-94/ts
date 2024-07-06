
import 'dart:convert';

/// name : "any string"
/// description : "any string"
/// longitude : "any string"
/// latitude : "any string"
/// id : 12
/// image : "any string"

Station stationFromJson(String str) => Station.fromJson(json.decode(str));
String stationToJson(Station data) => json.encode(data.toJson());
class Station {
  Station({
    this.name,
    this.description,
    this.longitude,
    this.latitude,
    this.id,
    this.image,});

  Station.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    id = json['id'];
    image = json['image'];
  }
  String? name;
  String? description;
  String? longitude;
  String? latitude;
  num? id;
  String? image;
  Station copyWith({  String? name,
    String? description,
    String? longitude,
    String? latitude,
    num? id,
    String? image,
  }) => Station(  name: name ?? this.name,
    description: description ?? this.description,
    longitude: longitude ?? this.longitude,
    latitude: latitude ?? this.latitude,
    id: id ?? this.id,
    image: image ?? this.image,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    map['id'] = id;
    map['image'] = image;
    return map;
  }
}