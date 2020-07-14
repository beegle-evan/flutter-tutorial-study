import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  final _formKey = GlobalKey<FormState>(); // 위젯을 나타내는 유니크한 값, form의 상태를 알 수 있

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody()
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text('Form Validation')
    );
  }

  _buildBody() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return '공백은 허용되지 않습니다';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(onPressed: () {
              if (_formKey.currentState.validate()) {
                // valid
                Scaffold.of(_formKey.currentContext).showSnackBar(SnackBar(content: Text('처리중'),));
              }
            },
            child: Text('완료'),),
          )
        ],
      ),
    );
  }
}
