import 'package:flutter/material.dart';

class MySwipeToDismiss extends StatefulWidget {
  @override
  _MySwipeToDismissState createState() => _MySwipeToDismissState();
}

class _MySwipeToDismissState extends State<MySwipeToDismiss> {
  final items = List<String>.generate(20, (index) => "Item ${index+1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text('SwipeToDismiss'),
    );
  }

  _buildBody() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        final item = items[index];
      return Dismissible(
        direction: DismissDirection.startToEnd,
        background: Container(color: Colors.red,),
        onDismissed: (direction) {
          setState(() {
            if (direction == DismissDirection.startToEnd) {

            }
            items.removeAt(index);
          });
        },
        child: ListTile(
          title: Text('${items[index]}'),
        ),
        key: Key(item),
      );
    });
  }
}
