import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/components/auth.dart';

import 'Cart.dart';
import 'LandingPage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => LandingPage())),
          ),
          title: Text(
            'PROFILE',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.black54,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('asset/images/icons/girl.png'),
                      radius: MediaQuery.of(context).size.height / 12,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            auth.userName,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 10),
                //color: Colors.teal,
                height: MediaQuery.of(context).size.height / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: auth.userName,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: auth.phoneNo,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: auth.address,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 11,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          'EDIT',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      auth.signOut();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
