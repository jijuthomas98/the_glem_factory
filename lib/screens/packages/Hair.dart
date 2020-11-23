import 'package:flutter/material.dart';

class Hair extends StatefulWidget {
  @override
  _HairState createState() => _HairState();
}

class _HairState extends State<Hair> {
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
          'HAIR',
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
