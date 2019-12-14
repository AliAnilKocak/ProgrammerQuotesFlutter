import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:programmerquotes/models/QuetoModel.dart';

class QuetoService{
  static Future<JsonDecoder> loadAsset() async {
    var response =  await rootBundle.loadString('assets/quotes.json');
    var jsonData = jsonDecode(response);
    return jsonData;
  }
}