import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../../../../core/util/extension/context_extensions.dart';
import 'image_card.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.width * 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 6, child: ImageCard()),
          Expanded(flex: 2, child: _petDetail(context))
        ],
      ),
    );
  }

  Column _petDetail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: nameOfPet(context)),
        Expanded(child: awayFrom()),
      ],
    );
  }

  Container nameOfPet(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Akira',
        style: context.textTheme.headline5!.copyWith(
          fontWeight: FontWeight.w900,
          fontFamily: 'Effra',
        ),
      ),
    );
  }

  Row awayFrom() {
    return Row(
      children: [
        SvgPicture.asset(SvgConstant.instance.navigation),
        Text(' 0.7km away')
      ],
    );
  }
}
