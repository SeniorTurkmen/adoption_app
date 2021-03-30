import 'package:adoption_app/core/core.dart';
import 'package:flutter/material.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Find your next\nbest Friend',
      style: _style(context),
    );
  }

  TextStyle _style(BuildContext context) {
    return context.textTheme.headline3!.copyWith(
        fontWeight: FontWeight.w900,
        color: Colors.black,
        height: 1.2,
        fontFamily: 'Effra');
  }
}
