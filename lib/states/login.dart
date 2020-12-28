import 'package:flutter/material.dart';
import 'package:ungfixproj/utility/dialog.dart';
import 'package:ungfixproj/utility/my_style.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildLogo(),
              buildForm(),
              buildLogin(),
              buildNewAccont(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildNewAccont() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account ?"),
        TextButton(
          onPressed: () {},
          child: Text(
            'Create a new account',
            style: TextStyle(color: Colors.red),
          ),
        )
      ],
    );
  }

  Container buildLogin() {
    return Container(
      width: 282,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: MyStyle().primaryColor,
        child: Text(
          'LOG IN',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(context, 'Have Space ? Please Fill Every Blank');
          } else {}
        },
      ),
    );
  }

  Container buildForm() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
      decoration: MyStyle().mainBG(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildUser(),
          buildPassword(),
        ],
      ),
    );
  }

  Container buildUser() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: MyStyle().mainBGwhite(),
      width: 250,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.perm_identity),
            labelText: 'USERNAME'),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: MyStyle().mainBGwhite(),
      width: 250,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.lock_outline),
            labelText: 'PASSWORD'),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 32),
      width: 120,
      child: Image.asset('images/logo.png'),
    );
  }
}
