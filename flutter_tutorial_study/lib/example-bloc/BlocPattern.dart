import 'package:flutter/material.dart';
import 'package:flutter_tutorial_study/example-bloc/CounterBloc.dart';

final counterBloc = CounterBloc();

class MyBloc extends StatefulWidget {
  @override
  _MyBlocState createState() => _MyBlocState();
}

class _MyBlocState extends State<MyBloc> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: counterBloc.count$,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  'You have pressed the button ${snapshot.data} times',
                  style: TextStyle(
                      fontSize: 20
                  )
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.addCounter();
        },
        child: Icon(Icons.add),
        tooltip: 'Increment Counter',
      ),
    );
  }
}
