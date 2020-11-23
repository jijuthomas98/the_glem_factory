import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/screens/LandingPage.dart';
import 'package:the_glem_factory/screens/Onboarding.dart';

import 'components/auth.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Auth>(context, listen: false);
    authService.getUserData();
    return StreamBuilder<User>(
      stream: authService.onAuthStateChange(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print('connection active');
          final user = snapshot.data;
          return user != null ? LandingPage() : Onboarding();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
