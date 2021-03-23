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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        shadowColor: Colors.transparent,
        leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: SvgPicture.asset('svg/paw.svg')),
      ),
      body: Consumer<HomeViewModel>(
        builder: (ctx, home, child) => Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              SearchBar(),
              PetTypeButtons(
                home: home,
              )
            ],
          ),
        ),
      ),
    );
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
