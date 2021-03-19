import 'package:flutter/material.dart';

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
          child: Image(
            image: NetworkImage(
              'http://www.drinkwell.com.tr/images/pati.png',
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find your next\nbest Friend',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Expanded(
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * .01),
                            border: InputBorder.none,
                            hintText: 'Search'),
                      ),
                    ),
                  ),
                  Icon(Icons.mic),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
