import 'package:flutter/material.dart';
import 'package:ungpinthong/utility/my_style.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field

  // Method
  Widget nameText() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: Colors.purple,
          ),
          labelText: 'Display Name :',
          labelStyle: TextStyle(
            color: Colors.purple,
          ),
          helperText: 'Type Your First Name in Blank',
          helperStyle: TextStyle(color: Colors.purple),
          hintText: 'English Only',
        ),
      ),
    );
  }

  Widget userText() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.account_box,
            size: 36.0,
            color: Colors.green,
          ),
          labelText: 'User :',
          labelStyle: TextStyle(
            color: Colors.green,
          ),
          helperText: 'Type Your User in Blank',
          helperStyle: TextStyle(color: Colors.green),
          hintText: 'English Only',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.orange,
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(
            color: Colors.orange,
          ),
          helperText: 'Type Your Password in Blank',
          helperStyle: TextStyle(color: Colors.orange),
          hintText: 'More 6 Caractor',
        ),
      ),
    );
  }

  Widget showCurrentDate() {
    DateTime dateTime = DateTime.now();
    print('dataTime = $dateTime');

    String dateString = DateFormat('yyyy-MM-dd').format(dateTime);
    print('dateString = $dateString');

    return Text(
      'Date = $dateString',
      style: MyStyle().myTextStyleH2,
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'Upload Value to Server',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().textColor,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white, MyStyle().mainColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            showCurrentDate(),
            SizedBox(
              height: 20.0,
            ),
            nameText(),
            userText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
