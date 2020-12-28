import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungfixproj/router.dart';

var initRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        initRoute = '/home';
      } else {
        initRoute = '/myService';
      }
      print('main Initial Success initRoute = $initRoute');
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: initRoute,
    );
  }
}
