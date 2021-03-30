import 'package:adoption_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: context.height * .1, horizontal: context.width * 2),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(Icons.search),
          Expanded(child: _searchField(context)),
          SvgPicture.asset('svg/mic.svg'),
        ],
      ),
    );
  }

  Form _searchField(BuildContext context) {
    return Form(
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .01),
            border: InputBorder.none,
            hintText: 'Search'),
      ),
    );
  }
}
