import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial_study/example-mise/models/AirResult.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // json.decode 사용을 위해서,,

class MiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mise Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MiseMain(),
    );
  }
}

class MiseMain extends StatefulWidget {
  @override
  _MiseMainState createState() => _MiseMainState();
}

class _MiseMainState extends State<MiseMain> {
  AirResult _result;

  Future<AirResult> fetchData() async {
    var response = await http.get('https://api.airvisual.com/v2/nearest_city?key=');
    AirResult result = AirResult.fromJson(json.decode(response.body));
    return result;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((airResult){
      setState(() {
        _result = airResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _result == null ? CircularProgressIndicator() : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('현재 위치 미세먼지',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 16.0,
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('얼굴사진'),
                          Text('${_result.data.current.pollution.aqius}', style: TextStyle(fontSize: 40),),
                          Text(getStrint(_result), style: TextStyle(fontSize: 40),),
                        ],
                      ),
                      color: getColor(_result),
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.network(
                                'https://airvisual.com/images/${_result.data.current.weather.ic}.png',
                                width: 32,
                                height: 32,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text('${_result.data.current.weather.tp}', style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          Text('습도 ${_result.data.current.weather.hu}%'),
                          Text('풍속 ${_result.data.current.weather.ws}m/s'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              ClipRRect( // 모서리를 둥글게 해주는 효과
                borderRadius: BorderRadius.circular(30),
                child: RaisedButton(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50),
                  color: Colors.orange,
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white
                  ),
                  onPressed: () {
                    fetchData().then((airResult){
                      setState(() {
                        _result = airResult;
                      });
                    });
                  }
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Color getColor(AirResult result) {
    if (result.data.current.pollution.aqius <= 50) {
      return Colors.greenAccent;
    } else if (result.data.current.pollution.aqius <= 100) {
      return Colors.yellow;
    } else if (result.data.current.pollution.aqius <= 150) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getStrint(AirResult result) {
    if (result.data.current.pollution.aqius <= 50) {
      return '좋음';
    } else if (result.data.current.pollution.aqius <= 100) {
      return '보통';
    } else if (result.data.current.pollution.aqius <= 150) {
      return '나쁨';
    } else {
      return '최악';
    }
  }
}
