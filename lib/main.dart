import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'view/home_view/home.dart';
import 'view/home_view/view_model/home_view_model.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Don\'t Buy! Adopt',
      routes: {
        Main.routeName: (_) => Main(),
        Home.routeName: (_) => Home(),
      },
      initialRoute: Main.routeName,
    );
  }
}

class Main extends StatelessWidget {
  static String routeName = '/';
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
          var sc = SizeConfig();
          sc.init(constraints, orientation);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ],
            builder: (ctx, child) {
              return Home();
            },
          );
        },
      ),
    );
  }
}
