import 'package:flutter_tutorial_study/example-mise/models/air_result.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class AirApiProvider {
  final _apiKey = '2ebd7fda-9660-443f-b637-66eb33174453';
  final _baseUrl = 'https://api.airvisual.com/v2/';

  Future<AirResult> fetchAirResult() async {
    final response = await http.get('${_baseUrl}nearest_city?key=${_apiKey}');

    if (response.statusCode != 200) {
      throw StateError('네트워크 에러 status code : ${response.statusCode}');
    }

    var json = convert.jsonDecode(response.body);
    return AirResult.fromJson(json);
  }
}