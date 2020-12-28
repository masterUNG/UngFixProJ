import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungfixproj/utility/dialog.dart';
import 'package:ungfixproj/utility/my_style.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email = '', password = '', confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildForm(),
          buildRegis(),
        ],
      ),
    );
  }

  Row buildRegis() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildButtonRegis(),
            Text('By Create Account You agree to our'),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Tems of Service',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Text(' and '),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Privacy Polycy',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Container buildButtonRegis() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: 250,
      child: RaisedButton(
        child: Text(
          'REGISTRATION',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: MyStyle().primaryColor,
        onPressed: () {
          print(
              'email = $email, password = $password, confirmPassword = $confirmPassword');
          if ((email?.isEmpty ?? true) ||
              (password?.isEmpty ?? true) ||
              (confirmPassword?.isEmpty ?? true)) {
            print('Have Space');
            normalDialog(context, 'Have Space ? Please Fill Every Blank');
          } else if (password == confirmPassword) {
            registerAndInsertUser();
          } else {
            normalDialog(context, 'Password Not Match ? Plases Try Again');
          }
        },
      ),
    );
  }

  Center buildForm() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildEmail(),
          buildPassword(),
          buildConfirmPassword(),
        ],
      ),
    );
  }

  Container buildEmail() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => email = value.trim(),
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
        ),
      );

  Container buildPassword() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      );

  Container buildConfirmPassword() => Container(
        width: 250,
        child: TextField(
          onChanged: (value) => confirmPassword = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            prefixIcon: Icon(Icons.lock_outline),
          ),
        ),
      );

  Future<Null> registerAndInsertUser() async {
    await Firebase.initializeApp().then((value) async {
      print('initial success');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        print('Register Success');
        Navigator.pushNamedAndRemoveUntil(
            context, '/myService', (route) => false);
      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
