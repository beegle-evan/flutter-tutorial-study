import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
        title: Text('MyDrawer')
    );
  }

  Widget _buildBody() {
    return Center(
      child: AnimatedOpacity(
        opacity: _visible ? 1.0: 0.0,
        duration: Duration(microseconds: 500),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _visible = !_visible;
        });
      },
      child: Icon(Icons.play_arrow),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Header'),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            title: Text('Item1'),
            onTap: () {
              // TODO
              // 할일 작성
              Navigator.pop(context); // draw를 닫아줌
            },
          ),
          ListTile(
            title: Text('Item2'),
            onTap: () {
              // TODO
              // 할일 작성
              Navigator.pop(context); // draw를 닫아줌
            },
          ),
          ListTile(
            title: Text('Item3'),
            onTap: () {
              // TODO
              // 할일 작성
              Navigator.pop(context); // draw를 닫아줌
            },
          )
        ],
      ),
    );
  }
}
