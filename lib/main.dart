import 'package:adoption_app/view/home_view/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Don\'t Buy! Adopt',
        theme: ThemeData(),
        home: MultiProvider(providers: [
          ChangeNotifierProvider<HomeViewModel>(
            create: (context) => HomeViewModel(),
          )
        ], child: App()),
      ),
    );
  }
}
