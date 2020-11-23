import 'package:flutter/material.dart';

class FacialAndClean extends StatefulWidget {
  @override
  _FacialAndCleanState createState() => _FacialAndCleanState();
}

class _FacialAndCleanState extends State<FacialAndClean> {
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
          'FACIAL & CLEAN UP',
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
