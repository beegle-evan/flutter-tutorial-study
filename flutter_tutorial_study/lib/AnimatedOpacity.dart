import 'package:flutter/material.dart';

class MyAnimatedOpacity extends StatefulWidget {
  @override
  _MyAnimatedOpacityState createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
        title: Text('AnimatedOpacity')
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
}
