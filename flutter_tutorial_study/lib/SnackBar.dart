import 'package:flutter/material.dart';

class MyStackBar extends StatefulWidget {
  @override
  _MyStackBarState createState() => _MyStackBarState();
}

class _MyStackBarState extends State<MyStackBar> {
  bool _visible = false;

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
        title: Text('MySnackBar')
    );
  }

  Widget _buildBody() {
    return Builder(builder: (context)=> Center(
        child: RaisedButton(onPressed: (){
          final snackBar = SnackBar(
            content: Text('This is snackBar'),
            action: SnackBarAction(label: 'exit', onPressed: () {
              // 눌렀을 때 처리

            },),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
          child: Text('Show Snack Bar'),
        ),
      )
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
