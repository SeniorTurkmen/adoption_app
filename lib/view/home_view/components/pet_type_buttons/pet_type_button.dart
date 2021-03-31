import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../view.dart';

class PetTypeButtons extends StatelessWidget {
  final HomeViewModel home;
  const PetTypeButtons({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buttonRow(context);
  }

  Row _buttonRow(BuildContext context) {
    return Row(
      children:
          home.listType.map((element) => _button(element, context)).toList(),
    );
  }

  GestureDetector _button(PetTypeButtonModel element, BuildContext context) {
    return GestureDetector(
      onTap: () => home.chageSituation(element.id),
      child: _buttonCard(element, context),
    );
  }

  Card _buttonCard(PetTypeButtonModel element, BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: element.type ? 10 : 0,
      shadowColor: Colors.black26,
      color: element.type ? Colors.white : Colors.grey[100],
      child: _buttonCardContent(context, element),
    );
  }

  Container _buttonCardContent(
      BuildContext context, PetTypeButtonModel element) {
    return Container(
        alignment: Alignment.center,
        width: context.height * 10,
        height: context.height * 10,
        child: _buttonContent(element, context));
  }

  Column _buttonContent(PetTypeButtonModel element, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buttonImage(element, context),
        _buttonText(element, context),
      ],
    );
  }

  Container _buttonImage(PetTypeButtonModel element, BuildContext context) {
    return Container(
      child: _svgPicture(element, context),
    );
  }

  SvgPicture _svgPicture(PetTypeButtonModel element, BuildContext context) {
    return SvgPicture.asset(
      '${element.imagePath}',
      color: getButtonColor(element.type),
      height: context.height * 6,
      width: context.width * 5,
    );
  }

  Text _buttonText(PetTypeButtonModel element, BuildContext context) {
    return Text(
      element.name,
      style: context.textTheme.bodyText2!
          .copyWith(color: getTextColor(element.type)),
    );
  }
}
