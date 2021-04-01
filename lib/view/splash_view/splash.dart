import 'dart:async';

import 'package:adoption_app/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.push(
            context, CupertinoPageRoute(builder: (_) => BottomNavigation())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LinearProgressIndicator(),
      ),
    );
  }
}
