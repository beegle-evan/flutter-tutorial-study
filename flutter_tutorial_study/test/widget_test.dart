// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial_study/example-mise/models/AirResult.dart';

import 'package:flutter_tutorial_study/main.dart';
import 'package:http/http.dart' as http;

import 'dart:convert'; // json.decode 사용을 위해서,,

void main() {
  test('http 통신 테스트',() async {
    var response = await http.get('https://api.airvisual.com/v2/nearest_city?key=2ebd7fda-9660-443f-b637-66eb33174453');
    expect(response.statusCode, 200);

    AirResult result = AirResult.fromJson(json.decode(response.body));
    expect(result.status, 'success');
  });
}
