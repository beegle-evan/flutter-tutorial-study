import 'package:flutter/material.dart';
import 'package:flutter_tutorial_study/AnimatedContainer.dart';
import 'package:flutter_tutorial_study/AnimatedOpacity.dart';
import 'package:flutter_tutorial_study/Drawer.dart';
import 'package:flutter_tutorial_study/OrientationBuilder.dart';
import 'package:flutter_tutorial_study/SnackBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.yellow,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.blue,
        accentColor: Colors.yellow,
        brightness: Brightness.dark
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder> {
        '/AnimatedContainer': (BuildContext context) => new MyAnimatedContainer(),
        '/AnimatedOpacity': (BuildContext context) => new MyAnimatedOpacity(),
        '/Drawer': (BuildContext context) => new MyDrawer(),
        '/OrientationBuilder': (BuildContext context) => new MyOrientation(),
        '/SnackBar': (BuildContext context) => new MySnackBar(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
//    return ListView(
//      children: <Widget>[
//        ListTile(
//          title: Text('item1'),
//          onTap: () {
//            Navigator.of(context).pushNamed('/Theme');
//          },
//        )
//      ],
//    );
    return MyOrientation();
  }
}
