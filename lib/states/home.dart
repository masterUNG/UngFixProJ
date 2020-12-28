import 'package:flutter/material.dart';
import 'package:ungfixproj/states/forgotpassword.dart';
import 'package:ungfixproj/states/login.dart';
import 'package:ungfixproj/states/registration.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // for Explicit
  List<Widget> widgets = [Registration(), Login(), ForgotPassword()];
  List<String> titles = ['Registration', 'Log In', 'Forgot Password'];
  List<Widget> tabWidgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createWidget();
  }

  void createWidget() {
    for (var title in titles) {
      Widget widget = Text(
        title,
        style: TextStyle(color: Colors.green),
      );
      tabWidgets.add(widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: Scaffold(
            appBar: TabBar(tabs: tabWidgets),
            body: TabBarView(children: widgets),
          ),
        ),
      ),
    );
  }
}
