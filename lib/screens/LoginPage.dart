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
String errorMessage;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
              address: _address
          );
          print(userId);
          print('User created');
        }
      } catch (e) {
        print(e);
        switch (e.code) {
          case "ERROR_EMAIL_ALREADY_IN_USE":
          case "account-exists-with-different-credential":
          case "email-already-in-use":
            errorMessage = "Email already used. Go to login page.";
            break;
          case "ERROR_WRONG_PASSWORD":
          case "wrong-password":
            errorMessage = "Wrong email/password combination.";
            break;
          case "ERROR_USER_NOT_FOUND":
          case "user-not-found":
            errorMessage = "No user found with this email.";
            break;
          case "ERROR_USER_DISABLED":
          case "user-disabled":
            errorMessage = "User disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
          case "operation-not-allowed":
            errorMessage = "Too many requests to log into this account.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
          case "operation-not-allowed":
            errorMessage = "Server error, please try again later.";
            break;
          case "ERROR_INVALID_EMAIL":
          case "invalid-email":
            errorMessage = "Email address is invalid.";
            break;
          case "ERROR_USER_NOT_FOUND":
          case "user-not-found":
            errorMessage = "No account found with this email";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
      }
      if (errorMessage != null) {
        _scaffoldKey.currentState
            .showSnackBar(new SnackBar(content: new Text(errorMessage)));
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
        key: _scaffoldKey,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Note: We currently serve only in Jabalpur',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        )
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
                'Don\'t have an account?',
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
