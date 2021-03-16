import 'package:flutter/material.dart';

enum Sex {
  Man,
  Woman,
}

class PersionItem {
  final Sex sex;
  final String name;
  final String nickName;
  final String avatar;
  final DateTime birthday;

  PersionItem({
    @required this.sex,
    @required this.name,
    this.nickName,
    this.avatar,
    this.birthday,
  });
}

class Persion with ChangeNotifier {
  List<PersionItem> _persion = [
    PersionItem(
      sex: Sex.Man,
      name: 'User Name 1',
    ),
    PersionItem(
      sex: Sex.Woman,
      name: 'User Name 2',
    ),
  ];

  List<PersionItem> get persion {
    return [..._persion];
  }

  PersionItem findBySex(Sex sex) {
    return _persion.firstWhere((element) => element.sex == sex);
  }

  void updatePersion(Sex sex, PersionItem item) {
    final persionIndex = _persion.indexWhere((element) => element.sex == sex);
    _persion[persionIndex] = item;
    notifyListeners();
  }
}
