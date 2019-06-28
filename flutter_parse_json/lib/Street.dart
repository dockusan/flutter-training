import 'package:json_annotation/json_annotation.dart';

abstract class Street {
  int type;
}

class BigRoad extends Street {
  int length;

  BigRoad({this.length}) {
    type = 1;
  }

  BigRoad.fromJson(Map<String, dynamic> json) {
    this.type = json['type'];
    this.length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['length'] = this.length;
    return data;
  }
}

class SmallRoad extends Street {
  String subName;

  SmallRoad({this.subName}) {
    type = 2;
  }

  SmallRoad.fromJson(Map<String, dynamic> json) {
    this.type = json['type'];
    this.subName = json['subName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['subName'] = this.subName;
    return data;
  }
}

class StreetData {
  List<Street> streets;

  StreetData({this.streets});

  StreetData.fromJson(Map<String, dynamic> json) {
    (json['streets'] as List).forEach((item) => print(item['type']));
    this.streets = (json['streets'] as List) != null
        ? (json['streets'] as List).map((i) => checkType(i)).toList()
        : null;
  }

  Street checkType(Map<String, dynamic> json) {
    switch (json['type']) {
      case 1:
        return BigRoad.fromJson(json);
      default:
        return SmallRoad.fromJson(json);
    }
  }
}
