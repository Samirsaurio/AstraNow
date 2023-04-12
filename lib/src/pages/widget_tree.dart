import 'package:astranow/auth.dart';
import 'package:astranow/src/pages/home_page.dart';
import 'package:astranow/src/pages/login_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot){
        if(snapshot.hasData){
          return HomePage();
        }
        else {
          return LoginPage();
        }
      }
    );
  }
}