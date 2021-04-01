import 'dart:io';

import 'package:flutter/material.dart';
import 'package:source_code/database/database_helper.dart';

class UserApp with ChangeNotifier {
  String nameMan;
  String avatarMan;
  String nameWoman;
  String avatarWoman;

  DateTime weddingDay;
  String bgSelectedPath;

  UserApp({
    this.nameMan = 'Name of the man',
    this.avatarMan = '',
    this.nameWoman = 'Name of the woman',
    this.avatarWoman = '',
    this.weddingDay,
    this.bgSelectedPath = '',
  });

  int _getWeddingDayMilliseconds() {
    if (weddingDay != null) {
      return weddingDay.millisecondsSinceEpoch;
    }
    return 0;
  }

  ImageProvider getBackgroundImage() {
    return bgSelectedPath.isNotEmpty
        ? FileImage(File(bgSelectedPath))
        : AssetImage("assets/images/background.png");
  }

  /// -------------------------------
  // Database methods
  Map<String, dynamic> toMap() {
    return {
      DataBaseHelper.columnId: 1,
      DataBaseHelper.columnNameMan: nameMan,
      DataBaseHelper.columnAvatarMan: avatarMan,
      DataBaseHelper.columnNameWoman: nameWoman,
      DataBaseHelper.columnAvatarWoman: avatarWoman,
      DataBaseHelper.columnWeddingDay: _getWeddingDayMilliseconds(),
      DataBaseHelper.columnBgSelected: bgSelectedPath,
    };
  }

  void readDataFromDB() async {
    final dbHelper = DataBaseHelper.instance;
    final map = await dbHelper.queryFirstRows();

    nameMan = map[DataBaseHelper.columnNameMan];
    avatarMan = map[DataBaseHelper.columnAvatarMan];
    nameWoman = map[DataBaseHelper.columnNameWoman];
    avatarWoman = map[DataBaseHelper.columnAvatarWoman];
    // Handle DateTime
    final weddingDayMillisecond = map[DataBaseHelper.columnWeddingDay];
    if (weddingDayMillisecond > 0) {
      weddingDay = DateTime.fromMillisecondsSinceEpoch(weddingDayMillisecond);
    }

    bgSelectedPath = map[DataBaseHelper.columnBgSelected];

    notifyListeners();
  }

  void initDataBase() async {
    final dbHelper = DataBaseHelper.instance;
    final rowCount = await dbHelper.queryRowCount();
    // insert only 1 row
    if (rowCount > 0) {
      print('Database have: $rowCount row');
      readDataFromDB();
      return;
    }
    // row to insert
    Map<String, dynamic> row = this.toMap();
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _updateDB() async {
    final dbHelper = DataBaseHelper.instance;
    Map<String, dynamic> row = this.toMap();
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  /// -------------------------------
  // Object methods
  final List<File> backgroundImages = [
    File("assets/images/background.png"),
  ];

  void addBackground(File pickedImage) {
    backgroundImages.add(pickedImage);
    notifyListeners();
  }

  void updateBackgroundSelected(String path) {
    bgSelectedPath = path;
    _updateDB();
    notifyListeners();
  }

  void updateWeddingDay(DateTime dateTime) {
    weddingDay = dateTime;
    _updateDB();
    notifyListeners();
  }

  /// For Man
  void updateNameMan(String name) {
    nameMan = name;
    _updateDB();
    notifyListeners();
  }

  void updateAvatarMan(String imagePath) {
    avatarMan = imagePath;
    _updateDB();
    notifyListeners();
  }

  /// For Woman
  void updateNameWoman(String name) {
    nameWoman = name;
    _updateDB();
    notifyListeners();
  }

  void updateAvatarWoman(String imagePath) {
    avatarWoman = imagePath;
    _updateDB();
    notifyListeners();
  }
}
