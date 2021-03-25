import 'dart:io';

import 'package:flutter/material.dart';

class UserApp with ChangeNotifier {
  String nameMan;
  String avatarMan;
  String nameWoman;
  String avatarWoman;

  DateTime weddingDay;

  final File brideImage;
  final File groomImage;
  final String brideName;
  final String groomName;

  UserApp({
    this.nameMan = 'Name of the man',
    this.avatarMan = '',
    this.nameWoman = 'Name of the woman',
    this.avatarWoman = '',
    this.weddingDay,
    this.brideImage,
    this.groomImage,
    this.brideName,
    this.groomName,
  });

  final List<File> backgroundImages = [
    File("assets/images/background.png"),
  ];

  void addBackground(File pickedImage) {
    backgroundImages.add(pickedImage);
    notifyListeners();
  }

  void updateBackground() {
    // ...
    notifyListeners();
  }

  void updateWeddingDay(DateTime dateTime) {
    weddingDay = dateTime;
    notifyListeners();
  }

  /// For Man
  void updateNameMan(String name) {
    nameMan = name;
    notifyListeners();
  }

  void updateAvatarMan(String imagePath) {
    avatarMan = imagePath;
    notifyListeners();
  }

  /// For Woman
  void updateNameWoman(String name) {
    nameWoman = name;
    notifyListeners();
  }

  void updateAvatarWoman(String imagePath) {
    avatarWoman = imagePath;
    notifyListeners();
  }
}
