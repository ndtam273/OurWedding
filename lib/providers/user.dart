import 'package:flutter/foundation.dart';
import 'dart:io';

class User with ChangeNotifier {
  final List<File> backgroundImages = [
    File("assets/images/background.png"),
  ];
  final File brideImage;
  final File groomImage;
  final String brideName;
  final String groomName;

  User({this.brideName, this.groomName, this.brideImage, this.groomImage});
  // start date here

  void addBackground(File pickedImage) {
    backgroundImages.add(pickedImage);
    notifyListeners();
  }
}
