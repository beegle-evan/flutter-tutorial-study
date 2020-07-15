import 'package:flutter/material.dart';
import 'package:flutter_tutorial_study/AnimatedContainer.dart';
import 'package:flutter_tutorial_study/AnimatedOpacity.dart';
import 'package:flutter_tutorial_study/Drawer.dart';
import 'package:flutter_tutorial_study/MethodChannel.dart';
import 'package:flutter_tutorial_study/OrientationBuilder.dart';
import 'package:flutter_tutorial_study/SnackBar.dart';
import 'package:flutter_tutorial_study/SwipeToDismiss.dart';
import 'package:flutter_tutorial_study/formvalidation.dart';
import 'package:flutter_tutorial_study/tabcontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//        primaryColor: Colors.blue,
//        accentColor: Colors.yellow,
//        brightness: Brightness.dark
      ),
      home: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(onPressed: () {
          navigatorKey.currentState.push(MaterialPageRoute(builder: (context) => SecondRoute()));
        }),
      )
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Flutter Tutorial'),
    );
  }

  Widget _buildBody() {
    return MyHomePage();
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello World",
        textDirection: TextDirection.ltr,
      )
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('AnimatedContainer'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAnimatedContainer()));
          },
        ),
        ListTile(
          title: Text('AnimatedOpacity'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyAnimatedOpacity()));
          },
        ),
        ListTile(
          title: Text('Drawer'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyDrawer()));
          },
        ),
        ListTile(
          title: Text('SnackBar'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MySnackBar()));
          },
        ),
        ListTile(
          title: Text('화면 방향에 따른 처리'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyOrientation()));
          },
        ),
        ListTile(
          title: Text('TabController'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyTabController()));
          },
        ),
        ListTile(
          title: Text('FormValidation'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyFormValidation()));
          },
        ),
        ListTile(
          title: Text('SwipeToDismiss'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MySwipeToDismiss()));
          },
        ),
        ListTile(
          title: Text('MethodChannel'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyMethodChannel()));
          },
        ),
      ],
    );
  }
}
