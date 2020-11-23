import 'package:flutter/material.dart';

class MakeUp extends StatefulWidget {
  @override
  _MakeUpState createState() => _MakeUpState();
}

class _MakeUpState extends State<MakeUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'MAKE UP',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
