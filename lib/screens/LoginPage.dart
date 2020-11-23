import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_glem_factory/components/auth.dart';

import '../constant.dart';

enum FormType { login, register }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final formKey = GlobalKey<FormState>();
String _email;
String _password;
String _name, _address;
String _phoneNo;
FormType _formType = FormType.login;
Image bgImage;

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bgImage = Image.asset('asset/images/Wallpapers/LoginAndSignUp.jpg');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(bgImage.image, context);
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        final auth = Provider.of<Auth>(context, listen: false);
        if (_formType == FormType.login) {
          String userId =
              await auth.signInWithEmailAndPassword(_email, _password);
          print(userId);
        } else {
          String userId =
              await auth.createUserWithEmailAndPassword(_email, _password);
          auth.registerUserData(
              fullName: _name,
              phoneNo: _phoneNo,
              address: _address,
              email: _email,
              password: _password);
          print(userId);
          print('User created');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: bgImage.image,
              fit: BoxFit.fitHeight,
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'inter',
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              'Use your ',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'S',
                              style: TextStyle(
                                color: Color(0xffff4b4b),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'inter',
                              ),
                            ),
                            Text(
                              'M',
                              style: TextStyle(
                                color: Color(0xffffa64d),
                                fontWeight: FontWeight.w700,
                                fontFamily: 'inter',
                              ),
                            ),
                            Text(
                              ' Account Credentials',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: buildInputs(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: buildSubmitButton(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    if (_formType == FormType.login) {
      return [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
          ),
          validator: (value) => value.isEmpty ? 'Email cant be empty' : null,
          onSaved: (value) => _email = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
          validator: (value) => value.isEmpty ? 'Password cant be empty' : null,
          onSaved: (value) => _password = value,
        ),
      ];
    } else {
      return [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Full Name',
          ),
          validator: (value) => value.isEmpty ? 'Name cant be empty' : null,
          onSaved: (value) => _name = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
          ),
          validator: (value) => value.isEmpty ? 'Email cant be empty' : null,
          onSaved: (value) => _email = value,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Phone No',
          ),
          validator: (value) => value.isEmpty ? 'Phone No cant be empty' : null,
          onSaved: (value) => _phoneNo = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
          validator: (value) => value.isEmpty ? 'Password cant be empty' : null,
          onSaved: (value) => _password = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Address',
          ),
          validator: (value) =>
              value.isEmpty ? 'Address No cant be empty' : null,
          onSaved: (value) => _address = value,
        ),
      ];
    }
  }

  List<Widget> buildSubmitButton() {
    if (_formType == FormType.login) {
      return [
        InkWell(
          onTap: validateAndSubmit,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              gradient: kGradientStyle,
            ),
            child: Center(
              child: Text(
                'LOG IN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'sfpro',
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Dont have account?',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'sfpro',
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                moveToRegister();
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffff7d85),
                ),
              ),
            ),
          ],
        ),
      ];
    } else {
      return [
        InkWell(
          onTap: validateAndSubmit,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              gradient: kGradientStyle,
            ),
            child: Center(
              child: Text(
                'SIGN IN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'sfpro',
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'You Already have account ?',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'sfpro',
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                moveToLogin();
              },
              child: Text(
                'LOG IN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffff7d85),
                ),
              ),
            ),
          ],
        ),
      ];
    }
  }
}
