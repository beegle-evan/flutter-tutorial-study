import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final counterSubject = BehaviorSubject<int>();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Add'),
              onPressed: (){
                counterSubject.add(++counter);
              },
            ),
            StreamBuilder<int>(
              stream: counterSubject.stream,
              initialData: 0,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      '${snapshot.data}',
                      style: TextStyle(
                          fontSize: 30
                      )
                  );
                }
              }
            )
          ],
        ),
      )
    );
  }
}
