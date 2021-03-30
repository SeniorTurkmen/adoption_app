import 'dart:html';

import 'package:adoption_app/core/constants/color_constants.dart';
import 'package:adoption_app/core/util/extension/context_extensions.dart';
import 'package:adoption_app/view/home_view/view_model/functions/button_functions.dart';
import 'package:adoption_app/view/home_view/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          shadowColor: Colors.transparent,
          leading: SvgPicture.asset('svg/paw.svg'),
        ),
        body: Consumer<HomeViewModel>(
          builder: (ctx, home, child) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(),
                SearchBar(),
                PetTypeButtons(
                  home: home,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nearby',
                          style: context.textTheme.headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'SEE ALL',
                            style: context.textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorPalette.instance.electricViolet),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        PetCard(),
                        PetCard(),
                        PetCard(),
                      ]),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  const PetCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ImageCard(), nameOfPet(context), awayFrom()],
      ),
    );
  }

  Text nameOfPet(BuildContext context) {
    return Text(
      'Akira',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Row awayFrom() {
    return Row(
      children: [SvgPicture.asset('svg/navigation.svg'), Text(' 0.7km away')],
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(),
      child: _clipRectangle(),
    );
  }

  ClipRRect _clipRectangle() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: _image(),
    );
  }

  Image _image() {
    return Image.asset(
      'image/cat1.png',
      fit: BoxFit.fill,
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(boxShadow: <BoxShadow>[
      BoxShadow(
          color: ColorPalette.instance.blackcurrant.withOpacity(.2),
          blurRadius: 15,
          spreadRadius: 1)
    ]);
  }
}

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
      color: element.type ? Theme.of(context).canvasColor : Colors.grey[100],
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
        _buttonImage(element),
        _buttonText(element, context),
      ],
    );
  }

  Container _buttonImage(PetTypeButtonModel element) {
    return Container(
      child: SvgPicture.asset(
        '${element.imagePath}',
        color: getButtonColor(element.type),
        height: SizeConfig.height * 6,
        width: SizeConfig.width * 5,
      ),
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

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Find your next\nbest Friend',
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.height * .5, horizontal: SizeConfig.width * 2),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(Icons.search),
          Expanded(
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .01),
                    border: InputBorder.none,
                    hintText: 'Search'),
              ),
            ),
          ),
          Icon(Icons.mic),
        ],
      ),
    );
  }
}
