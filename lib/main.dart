import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/core.dart';
import 'view/home_view/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return LayoutBuilder(
      builder: (ctxLayout, constraints) => OrientationBuilder(
        builder: (ctxOrientation, orientation) {
          SizeConfig.init(constraints, orientation);
          return Home();
        },
      ),
    );
  }
}
