import 'package:flutter/material.dart';

class Waxing extends StatefulWidget {
  @override
  _WaxingState createState() => _WaxingState();
}

class _WaxingState extends State<Waxing> {
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
          'WAXING',
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
