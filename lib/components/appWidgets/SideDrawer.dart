import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/Maps/geoLocation.dart';
import 'package:the_glem_factory/screens/AboutUs.dart';
import 'package:the_glem_factory/screens/SafetyMeasures.dart';
import 'package:the_glem_factory/screens/Services.dart';
import 'package:the_glem_factory/screens/TermsAndConditions.dart';
import 'package:the_glem_factory/screens/packages/ClassicPackage.dart';
import '../auth.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    auth.getUserData();
    return Drawer(
      child: Container(
        //color: Color(0xffFF7d85),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.person,
                    color: Colors.white70,
                    size: 50.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xfffafafa),
              ),
              accountName: Text(
                auth.userName,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'sfpro',
                ),
              ),
              accountEmail: null,
            ),
            Divider(
              thickness: 0.5,
            ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Services())),
                    leading: Icon(
                      Icons.touch_app,
                    ),
                    title: Text(
                      'Services',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserInputLocation())),
                    leading: Icon(
                      Icons.map_outlined,
                    ),
                    title: Text(
                      'Pin Location',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs())),
                    leading: Icon(
                      Icons.supervised_user_circle,
                    ),
                    title: Text(
                      'About us',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ClassicPackage())),
                    leading: Icon(
                      Icons.ac_unit,
                    ),
                    title: Text(
                      'Offers',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsAndConditions())),
                    leading: Icon(
                      Icons.account_balance,
                    ),
                    title: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SafetyMeasures())),
                    leading: Icon(
                      Icons.airline_seat_individual_suite,
                    ),
                    title: Text(
                      'Safety Measures',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
