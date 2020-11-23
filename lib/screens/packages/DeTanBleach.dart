import 'package:flutter/material.dart';

class DeTanBleach extends StatefulWidget {
  @override
  _DeTanBleachState createState() => _DeTanBleachState();
}

class _DeTanBleachState extends State<DeTanBleach> {
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
          'DE TAN & BLEACH',
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
