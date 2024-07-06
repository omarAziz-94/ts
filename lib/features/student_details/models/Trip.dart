import 'dart:convert';

import 'package:parent/core/utils/date_time_utils.dart';
/// id : 1
/// templateId : 12
/// date : "2022-08-13T08:30:00.000Z"
/// isGoing : false
/// isActive : true
/// currentStationId : 1
/// departed : ""
/// arrived : ""
/// bus : {"id":1,"name":"B-Bus","plate":"P2s2"}
/// driver : {"id":1,"name":"B-Driver","license":"P212","phone":"","nfc":""}
/// route : {"id":1,"name":"Madint Nasr","description":"jsjs","stations":[{"id":3,"order":1,"station":{"id":1,"name":"F-St1","description":"ssa","image":"","longitude":"","latitude":""}},{"id":4,"order":2,"station":{"id":2,"name":"F-St1","description":"xsdds","image":"","longitude":"","latitude":""}}]}
/// currentStation : {"id":1,"name":"F-St1","description":"ssa","image":"","longitude":"","latitude":""}

Trip tripFromJson(String str) => Trip.fromJson(json.decode(str));
String tripToJson(Trip data) => json.encode(data.toJson());
class Trip {
  Trip({
      this.id, 
      this.templateId, 
      this.date, 
      this.isGoing, 
      this.isActive, 
      this.currentStationId, 
      this.departed, 
      this.arrived,
      this.driver, 
      this.route, 
      // this.currentStation,
  });

  Trip.fromJson(dynamic json) {
    id = json['id'];
    templateId = json['templateId'];
    date = DateTimeUtils.dateOrNull(json['date']);
    isGoing = json['isGoing'];
    isActive = json['isActive'];
    currentStationId = json['currentStationId'];
    departed = DateTimeUtils.dateOrNull(json['departed']);
    arrived = DateTimeUtils.dateOrNull(json['arrived']);
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    route = json['route'] != null ? Route.fromJson(json['route']) : null;
    // currentStation = json['currentStation'] != null ? CurrentStation.fromJson(json['currentStation']) : null;
  }
  num? id;
  num? templateId;
  DateTime? date;
  bool? isGoing;
  bool? isActive;
  num? currentStationId;
  DateTime? departed;
  DateTime? arrived;
  Driver? driver;
  Route? route;
  // CurrentStation? currentStation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['templateId'] = templateId;
    map['date'] = date;
    map['isGoing'] = isGoing;
    map['isActive'] = isActive;
    map['currentStationId'] = currentStationId;
    map['departed'] = departed;
    map['arrived'] = arrived;
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    if (route != null) {
      map['route'] = route?.toJson();
    }
    // if (currentStation != null) {
    //   map['currentStation'] = currentStation?.toJson();
    // }
    return map;
  }

}

/// id : 1
/// name : "F-St1"
/// description : "ssa"
/// image : ""
/// longitude : ""
/// latitude : ""

CurrentStation currentStationFromJson(String str) => CurrentStation.fromJson(json.decode(str));
String currentStationToJson(CurrentStation data) => json.encode(data.toJson());
class CurrentStation {
  CurrentStation({
      this.id, 
      this.name, 
      this.description, 
      this.image, 
      this.longitude, 
      this.latitude,});

  CurrentStation.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
  num? id;
  String? name;
  String? description;
  String? image;
  String? longitude;
  String? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    return map;
  }

}

/// id : 1
/// name : "Madint Nasr"
/// description : "jsjs"
/// stations : [{"id":3,"order":1,"station":{"id":1,"name":"F-St1","description":"ssa","image":"","longitude":"","latitude":""}},{"id":4,"order":2,"station":{"id":2,"name":"F-St1","description":"xsdds","image":"","longitude":"","latitude":""}}]

Route routeFromJson(String str) => Route.fromJson(json.decode(str));
String routeToJson(Route data) => json.encode(data.toJson());
class Route {
  Route({
      this.id, 
      this.name, 
      this.description, 
      this.stations,});

  Route.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['stations'] != null) {
      stations = [];
      json['stations'].forEach((v) {
        stations?.add(Stations.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  String? description;
  List<Stations>? stations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    if (stations != null) {
      map['stations'] = stations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// order : 1
/// station : {"id":1,"name":"F-St1","description":"ssa","image":"","longitude":"","latitude":""}

Stations stationsFromJson(String str) => Stations.fromJson(json.decode(str));
String stationsToJson(Stations data) => json.encode(data.toJson());
class Stations {
  Stations({
      this.id, 
      this.order, 
      this.station,});

  Stations.fromJson(dynamic json) {
    id = json['id'];
    order = json['order'];
    station = json['station'] != null ? Station.fromJson(json['station']) : null;
  }
  num? id;
  num? order;
  Station? station;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['order'] = order;
    if (station != null) {
      map['station'] = station?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "F-St1"
/// description : "ssa"
/// image : ""
/// longitude : ""
/// latitude : ""

Station stationFromJson(String str) => Station.fromJson(json.decode(str));
String stationToJson(Station data) => json.encode(data.toJson());
class Station {
  Station({
      this.id, 
      this.name, 
      this.description, 
      this.image, 
      this.longitude, 
      this.latitude,});

  Station.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }
  num? id;
  String? name;
  String? description;
  String? image;
  String? longitude;
  String? latitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;
    map['longitude'] = longitude;
    map['latitude'] = latitude;
    return map;
  }

}

/// id : 1
/// name : "B-Driver"
/// license : "P212"
/// phone : ""
/// nfc : ""

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));
String driverToJson(Driver data) => json.encode(data.toJson());
class Driver {
  Driver({
      this.id, 
      this.name, 
      this.license, 
      this.phone, 
      this.nfc,});

  Driver.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    license = json['license'];
    phone = json['phone'];
    nfc = json['nfc'];
  }
  num? id;
  String? name;
  String? license;
  String? phone;
  String? nfc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['license'] = license;
    map['phone'] = phone;
    map['nfc'] = nfc;
    return map;
  }

}
