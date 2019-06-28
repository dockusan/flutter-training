import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'Street.dart';
import 'dart:async';

class StudentRepository {
  Future<String> loadStudentJson() async {
    return await rootBundle.loadString('assets/data/multiple_type.json');
  }

  Future loadStudent() async {
    String data = await loadStudentJson();
    final jsonResponse = json.decode(data);
    StreetData streetData = StreetData.fromJson(jsonResponse);
    print(streetData.streets);
  }
}
