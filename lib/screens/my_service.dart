import 'package:flutter/material.dart';
import 'package:ungpinthong/models/user_model.dart';
import 'package:ungpinthong/widget/page1.dart';
import 'package:ungpinthong/widget/page2.dart';
import 'package:ungpinthong/widget/page3.dart';

class MyService extends StatefulWidget {
  final UserModel userModel;
  MyService({Key key, this.userModel}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Field
  UserModel myUserModel;
  Widget currentWidget = Page1();

  // Method
  Widget menuPage1() {
    return ListTile(
      leading: Icon(
        Icons.filter_1,
        size: 36.0,
        color: Colors.blue,
      ),
      title: Text('Page 1'),
      subtitle: Text('Detail of Page 1'),
      onTap: () {
        setState(() {
          currentWidget = Page1();
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget menuPage2() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
        size: 36.0,
        color: Colors.purple,
      ),
      title: Text('Read QR code'),
      subtitle: Text('Demo Show Read QR code'),
      onTap: () {
        setState(() {
          currentWidget = Page2();
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget menuPage3() {
    return ListTile(
      leading: Icon(
        Icons.filter_2,
        size: 36.0,
        color: Colors.orange,
      ),
      title: Text('Page 3'),
      subtitle: Text('Detail of Page 3'),
      onTap: () {
        setState(() {
          currentWidget = Page3();
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget headDrawer() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          showLogo(),
          showLogin(),
        ],
      ),
    );
  }

  Widget showLogin() {
    return Text('Login by ${myUserModel.name}');
  }

  Widget showLogo() {
    return Container(
      height: 80.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headDrawer(),menuPage1(),menuPage2(),menuPage3(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    myUserModel = widget.userModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: currentWidget,
      drawer: showDrawer(),
    );
  }
}
