import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial_study/example-mise/bloc/air_bloc.dart';
import 'package:flutter_tutorial_study/example-mise/models/air_result.dart';

final airBloc = AirBloc();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: StreamBuilder<AirResult>(
            stream: airBloc.airResult,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return buildItem(snapshot.data);
              } else {
                return CircularProgressIndicator();
              }
            }
          ),
        )
      )
    );
  }

  Widget buildItem(AirResult result) {
    return Column(
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
                    Text('${result.data.current.pollution.aqius}', style: TextStyle(fontSize: 40),),
                    Text(getStrint(result), style: TextStyle(fontSize: 40),),
                  ],
                ),
                color: getColor(result),
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
                          'https://airvisual.com/images/${result.data.current.weather.ic}.png',
                          width: 32,
                          height: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('${result.data.current.weather.tp}', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    Text('습도 ${result.data.current.weather.hu}%'),
                    Text('풍속 ${result.data.current.weather.ws}m/s'),
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
              airBloc.refresh();
            }
          ),
        ),
      ],
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
