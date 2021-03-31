import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'nearby_pets.dart';


class NearbyPets extends StatelessWidget {
  const NearbyPets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(context),
        Spacer(),
        Expanded(
          flex: 9,
          child: _petCardList(),
        )
      ],
    );
  }

  Row _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_headerText(context), _seeAllButton(context)],
    );
  }

  Text _headerText(BuildContext context) {
    return Text(
      'Nearby',
      style: context.textTheme.headline5!
          .copyWith(fontWeight: FontWeight.w900, fontFamily: 'Effra'),
    );
  }

  InkWell _seeAllButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        'SEE ALL',
        style: context.textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorPalette.instance.electricViolet),
      ),
    );
  }

  ListView _petCardList() {
    return ListView(scrollDirection: Axis.horizontal, children: [
      PetCard(),
      PetCard(),
      PetCard(),
    ]);
  }
}
