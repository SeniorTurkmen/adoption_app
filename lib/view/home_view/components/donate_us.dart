import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/util/clipper.dart';
import '../../../core/util/extension/context_extensions.dart';

class DonateUs extends StatelessWidget {
  const DonateUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: _donateSection(context),
    );
  }

  Container _donateSection(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: ColorPalette.instance.snuff.withOpacity(.2),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _textSection(context),
          ),
          Expanded(
            child: _image(),
          )
        ],
      ),
    );
  }

  Center _textSection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_title(context), _subTitle(context)],
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      'Donate us!',
      style: context.textTheme.headline4!.copyWith(
          color: ColorPalette.instance.electricViolet,
          fontFamily: 'Effra',
          fontWeight: FontWeight.w900),
    );
  }

  Text _subTitle(BuildContext context) {
    return Text(
        'Your donation helps us to run\n'
        'this greate service.',
        style: context.textTheme.subtitle1!.copyWith(
          color: ColorPalette.instance.blackcurrant,
          fontFamily: 'Effra',
        ));
  }

  ClipPath _image() {
    return ClipPath(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        clipper: QuadraticClipper(),
        child: Image.asset(
          'image/cat7.png',
          fit: BoxFit.fitWidth,
        ));
  }
}
