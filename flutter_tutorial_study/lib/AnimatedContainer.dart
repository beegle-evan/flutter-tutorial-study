import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadius _borderRadius = BorderRadius.circular(8);

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
        title: Text('AnimatedContainer')
    );
  }

  Widget _buildBody() {
    return Center(
      child: AnimatedContainer(
        width: _width,
        height: _height,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn, // 제공되어지는 여러 효과가 있다.
        decoration: BoxDecoration(
            color: _color,
            borderRadius:_borderRadius
        ),
      )
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          final random = Random();
          _width = random.nextInt(300).toDouble();
          _height = random.nextInt(300).toDouble();
          _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
          _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
        });
      },
      child: Icon(Icons.play_arrow)
    );
  }
}
