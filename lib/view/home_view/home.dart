import 'package:adoption_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'home_view.dart';

class Home extends StatelessWidget {
  static String routeName = '/';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: _consumerBuild(context),
    );
  }

  Consumer<HomeViewModel> _consumerBuild(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (ctx, home, child) => _build(context, home),
    );
  }

  Padding _build(BuildContext context, HomeViewModel home) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 2.5),
      child: Container(
        child: _body(home),
      ),
    );
  }

  Column _body(HomeViewModel home) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _list(home),
    );
  }

  List<Widget> _list(HomeViewModel home) {
    return <Widget>[
      Expanded(flex: 2, child: HeaderWidget()),
      Expanded(child: SearchBar()),
      Expanded(flex: 2, child: PetTypeButtons(home: home)),
      Expanded(flex: 5, child: NearbyPets()),
      Expanded(flex: 3, child: DonateUs()),
      Expanded(child: Container()),
    ];
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leadingWidth: context.width * 10,
      backgroundColor: Theme.of(context).canvasColor,
      shadowColor: Colors.transparent,
      leading: SvgPicture.asset('svg/paw.svg'),
    );
  }
}
