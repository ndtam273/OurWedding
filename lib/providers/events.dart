import 'dart:io';

import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../database/database_helper.dart';
import '../database/db_helper.dart';
import '../model/event.dart';

class Events with ChangeNotifier {
  List<Event> _items = [];

  List<Event> get items {
    return [..._items];
  }

  void addEvent() {
    final newEvent = Event(
      id: DateTime.now().toString(),
    );
    _items.add(newEvent);
    notifyListeners();
    // DataBaseHelper.insert('events', {
    //   'id': newEvent.id,
    //   'date': newEvent.eventDate,
    //   'woman_name': newEvent.womanName,
    //   'woman_avt': newEvent.womanAvatar,
    //   'man_name': newEvent.manName,
    //   'man_avt': newEvent.manAvatar,
    //   'background': newEvent.background
    // });
  }

  Future<void> updateEvent(String id, Event updateEvent) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      try {
        // update provider
        _items[prodIndex] = updateEvent;
        // save db
        final updateEventMap = updateEvent.toMap();
        await DBHelper.update(updateEventMap, 'user_data');
        notifyListeners();
      } catch (error) {
        throw error;
      }
    } else {
      print('...');
    }
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('events');

    _items = dataList
        .map((item) => Event(
            id: item['id'],
            eventDate: item['date'],
            womanName: item['woman_name'],
            womanAvatar: item['woman_avt'],
            manAvatar: item['man_avt'],
            manName: item['man_name'],
            background: item['background']))
        .toList();

    notifyListeners();
  }
}
