import 'package:flutter/material.dart';

class MyTabController extends StatefulWidget {
  @override
  _MyTabControllerState createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
      length: 3,
    );
  }

  Widget _buildDrawer() {

  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('MyTabController'),
      bottom: TabBar(tabs: [
        Tab(icon: Icon(Icons.access_alarm),),
        Text('Tab2'),
        Text('Tab3'),
      ]),
    );
  }

  Widget _buildBody() {
    return TabBarView(children: <Widget>[
      Icon(Icons.access_alarm),
      Text('Tab2'),
      Text('Tab3'),
    ],);
  }

  Widget _buildFloatingActionButton() {

  }
}
