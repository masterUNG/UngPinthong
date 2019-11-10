import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ungpinthong/models/user_model.dart';
import 'package:ungpinthong/screens/my_service.dart';
import 'package:ungpinthong/screens/register.dart';
import 'package:ungpinthong/utility/my_alert.dart';
import 'package:ungpinthong/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field
  final formKey = GlobalKey<FormState>();
  String user, password;
  UserModel userModel;

  // Method
  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  Future<void> checkInternet() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      if ((result.isNotEmpty) && (result[0].rawAddress.isNotEmpty)) {
        print('Internet Connected');
      }
    } catch (e) {
      
      normalDialog(context, 'Internet False', 'Please Check Internet');
    }
  }

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        shape: MyStyle().curveButton,
        color: MyStyle().textColor,
        child: Text(
          'Sign In',
          style: MyStyle().myWhiteTextStyle,
        ),
        onPressed: () {
          formKey.currentState.save();
          print('user = $user, password = $password');
          checkAuthen();
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    if ((user.isEmpty) || (password.isEmpty)) {
      // Have Space
      normalDialog(context, 'Have Space', 'Please Fill All Every Blank');
    } else {
      // No Space

      String url =
          'https://www.androidthai.in.th/pint/getUserWhereUserMaster.php?isAdd=true&User=$user';
      var response = await http.get(url, headers: {'Aceept': 'application/json'});
      var result = json.decode(response.body);
      print('result = $result');

      if (result.toString() == 'null') {
        normalDialog(context, 'User False', 'No $user in my Database');
      } else {
        for (var map in result) {
          print('map = $map');
          userModel = UserModel.fromAPI(map);

          // Check Password
          if (password == userModel.password) {

            // Move to MyService
            MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context){return MyService(userModel: userModel,);});
            Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route){return false;});

          } else {
            normalDialog(
                context, 'Password False', 'Please Try Agains Password');
          }
        }
      }
    } // if
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        shape: MyStyle().curveButton,
        borderSide: BorderSide(color: MyStyle().textColor),
        child: Text(
          'Sign Up',
          style: TextStyle(color: MyStyle().textColor),
        ),
        onPressed: () {
          print('You Click SignUp');

          // Create Route Arrow Back
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) {
            return Register();
          });
          Navigator.of(context).push(materialPageRoute);
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          signInButton(),
          SizedBox(
            width: 4.0,
          ),
          signUpButton(),
        ],
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(initialValue: 'Doramon',
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyStyle().textColor),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: 'User :',
          labelStyle: TextStyle(color: Colors.white),
        ),
        onSaved: (value) {
          user = value.trim();
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.white),
        ),
        onSaved: (value) {
          password = value.trim();
        },
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung Pinthong',
      style: TextStyle(
        fontSize: MyStyle().h1,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: MyStyle().textColor,
        fontFamily: MyStyle().nameFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wallpaper.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              padding: MyStyle().myPadding,
              color: Color.fromARGB(100, 0, 0, 0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showLogo(),
                    showAppName(),
                    userText(),
                    passwordText(),
                    SizedBox(
                      height: 8.0,
                    ),
                    showButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
