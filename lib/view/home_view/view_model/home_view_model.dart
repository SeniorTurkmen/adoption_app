import 'package:flutter/material.dart';

import '../../../core/core.dart';

class HomeViewModel extends ChangeNotifier {
  late List<PetTypeButtonModel> listType = [];

  HomeViewModel() {
    var map = [
      {
        'id': '001',
        'imagePath': 'assets/svg/cat.svg',
        'name': 'Cat',
        'type': true,
      },
      {
        'id': '002',
        'imagePath': 'assets/svg/dog.svg',
        'name': 'Dog',
        'type': true,
      }
    ];
    listType = map.map((e) => PetTypeButtonModel.fromJson(e)).toList();
  }
  void chageSituation(String id) {
    listType.firstWhere((element) => element.id == id).type =
        !listType.firstWhere((element) => element.id == id).type;
    notifyListeners();
  }
}
