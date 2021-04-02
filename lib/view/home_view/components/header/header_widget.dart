import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Find your next\nbest Friend',
        style: _style(context),
      ),
    );
  }

  TextStyle _style(BuildContext context) {
    return context.textTheme.headline4!.copyWith(
        fontWeight: FontWeight.w900, color: Colors.black, fontFamily: 'Effra');
  }
}
