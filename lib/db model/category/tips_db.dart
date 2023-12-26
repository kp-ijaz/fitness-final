import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homeworkout/db%20model/tips_model.dart';

const TIPS_DB_NAME = "tips_db";

abstract class TipsDbFunction {
  Future<void> addTips(TipsModal obj);
  Future<List<TipsModal>> getAllTips();
  Future<void> refreshtips();
  Future<void> deleteTips(String id);
}

class TipsDB implements TipsDbFunction {
  TipsDB._internal();

  static TipsDB instance = TipsDB._internal();

  factory TipsDB() {
    return instance;
  }

  ValueNotifier<List<TipsModal>> urlListNotifier = ValueNotifier([]);

  @override
  Future<void> addTips(TipsModal obj) async {
    final _Tipsdb = await Hive.openBox<TipsModal>(TIPS_DB_NAME);
    await _Tipsdb.put(obj.id!, obj);
    urlListNotifier.value.clear();
    await refreshtips();
  }

  @override
  Future<List<TipsModal>> getAllTips() async {
    final _Tipsdb = await Hive.openBox<TipsModal>(TIPS_DB_NAME);
    return _Tipsdb.values.toList();
  }

  @override
  Future<void> refreshtips() async {
    final allData = await getAllTips();
    urlListNotifier.value.clear();
    Future.forEach(allData, (element) async {
      urlListNotifier.value.add(element);
      urlListNotifier.notifyListeners();
    });
  }

  @override
  Future<void> deleteTips(String id) async {
    final _Tipsdb = await Hive.openBox<TipsModal>(TIPS_DB_NAME);
    await _Tipsdb.delete(id);
    await refreshtips();
  }
}
