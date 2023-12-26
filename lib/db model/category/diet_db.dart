// import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
// import 'package:homeworkout/db/diet_model.dart';

const DIET_DB_NAME = 'diet-db';

abstract class DietDbFunctions {
  Future<void> addDiet(DietModal obj);
  Future<List<DietModal>> getAllDiet();
  Future<void> deletediet(String id);
}

class DietDB implements DietDbFunctions {
  DietDB._internal();

  static DietDB instance = DietDB._internal();

  factory DietDB() {
    return instance;
  }

  ValueNotifier<List<DietModal>> breakfastListNotifier = ValueNotifier([]);
  ValueNotifier<List<DietModal>> lunchListNotifier = ValueNotifier([]);
  ValueNotifier<List<DietModal>> dinnerListNotifier = ValueNotifier([]);

  @override
  Future<void> addDiet(DietModal obj) async {
    final _dietdb = await Hive.openBox<DietModal>(DIET_DB_NAME);
    await _dietdb.put(obj.id!, obj);

    breakfastListNotifier.value.clear();
    lunchListNotifier.value.clear();
    dinnerListNotifier.value.clear();
    await refresh();
  }

  Future<void> refresh() async {
    final allData = await getAllDiet();
    breakfastListNotifier.value.clear();
    lunchListNotifier.value.clear();
    dinnerListNotifier.value.clear();

    Future.forEach(allData, (element) async {
      if (element.type == DietType.breakfast) {
        breakfastListNotifier.value.add(element);
      } else if (element.type == DietType.lunch) {
        lunchListNotifier.value.add(element);
      } else {
        dinnerListNotifier.value.add(element);
      }
      breakfastListNotifier.notifyListeners();
      lunchListNotifier.notifyListeners();
      dinnerListNotifier.notifyListeners();
    });
  }

  @override
  Future<List<DietModal>> getAllDiet() async {
    final _dietdb = await Hive.openBox<DietModal>(DIET_DB_NAME);
    return _dietdb.values.toList();
  }

  @override
  Future<void> deletediet(String id) async {
    final _dietdb = await Hive.openBox<DietModal>(DIET_DB_NAME);
    await _dietdb.delete(id);
    await refresh();
  }
}
