import 'package:flutter/material.dart';
import 'package:ungfixproj/states/home.dart';
import 'package:ungfixproj/states/my_service.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home':(BuildContext context)=>Home(),
  '/myService':(BuildContext context)=>MyService(),
};
