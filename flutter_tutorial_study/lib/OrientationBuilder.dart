import 'package:flutter/material.dart';

class MyOrientation extends StatefulWidget {
  @override
  _MyOrientationState createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildDrawer() {}

  Widget _buildAppBar() {
    return AppBar(
        title: Text('MyOrientation')
    );
  }

  Widget _buildBody() {
    //return _buildGridViewByManually();
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return _buildGridViewByAuto(orientation);
      },
    );
  }

  Widget _buildGridViewByAuto(orientation) {
    return GridView.count(
      crossAxisCount: orientation==Orientation.portrait ? 3: 5,
      children: List.generate(50, (position) {
        return Center(
          child: Text('Item $position'),
        );
      })
    );
  }

  Widget _buildGridViewByManually() {
    return GridView.count(crossAxisCount: 3,
      children: <Widget>[
        Center(child: Text('Item 1')),
        Center(child: Text('Item 1')),
        Center(child: Text('Item 1')),
        Center(child: Text('Item 1')),
        Center(child: Text('Item 1')),
        Center(child: Text('Item 1')),
      ],
    );
  }

  Widget _buildFloatingActionButton() {}
}
